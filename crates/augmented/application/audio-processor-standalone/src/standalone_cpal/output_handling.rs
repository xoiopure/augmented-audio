// Augmented Audio: Audio libraries and applications
// Copyright (c) 2022 Pedro Tacla Yamada
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

//! CPAL output stream handling. This reads input samples (if there's an input
//! stream) and ticks the audio processor forward.
//!
//! It will also forward MIDI events that happened between frames.

use cpal::{traits::DeviceTrait, StreamConfig};
use ringbuf::Consumer;

use audio_processor_traits::{AudioBuffer, AudioContext, AudioProcessor};

use crate::StandaloneProcessor;

use super::error::AudioThreadError;
#[cfg(feature = "midi")]
use super::midi::MidiContext;

pub struct BuildOutputStreamParams<SP: StandaloneProcessor, D: DeviceTrait> {
    pub app: SP,
    #[cfg(feature = "midi")]
    pub midi_context: Option<MidiContext>,
    pub audio_context: AudioContext,
    pub num_output_channels: usize,
    pub num_input_channels: usize,
    pub input_consumer: Consumer<f32>,
    pub output_device: D,
    pub output_config: StreamConfig,
}

/// Build the output callback stream with CPAL and return it.
pub fn build_output_stream<SP: StandaloneProcessor, Device: DeviceTrait>(
    params: BuildOutputStreamParams<SP, Device>,
) -> Result<Device::Stream, AudioThreadError> {
    let BuildOutputStreamParams {
        mut app,
        #[cfg(feature = "midi")]
        mut midi_context,
        mut audio_context,
        num_output_channels,
        num_input_channels,
        mut input_consumer,
        output_device,
        output_config,
    } = params;
    // Output callback section
    log::info!(
        "num_input_channels={} num_output_channels={} sample_rate={}",
        num_input_channels,
        num_output_channels,
        output_config.sample_rate.0
    );
    let mut audio_buffer = AudioBuffer::empty();
    audio_buffer.resize(
        num_output_channels,
        match output_config.buffer_size {
            cpal::BufferSize::Default => 1024,
            cpal::BufferSize::Fixed(size) => size as usize,
        },
    );

    let output_stream = output_device
        .build_output_stream(
            &output_config,
            move |data: &mut [f32], _output_info: &cpal::OutputCallbackInfo| {
                output_stream_with_context(OutputStreamFrameContext {
                    #[cfg(feature = "midi")]
                    midi_context: midi_context.as_mut(),
                    audio_context: &mut audio_context,
                    processor: &mut app,
                    num_input_channels,
                    num_output_channels,
                    consumer: &mut input_consumer,
                    data,
                    audio_buffer: &mut audio_buffer,
                });
            },
            |err| {
                log::error!("Playback error: {:?}", err);
            },
            None,
        )
        .map_err(AudioThreadError::BuildOutputStreamError)?;

    Ok(output_stream)
}

/// Data borrowed to process a single output frame.
struct OutputStreamFrameContext<'a, SP: StandaloneProcessor> {
    #[cfg(feature = "midi")]
    midi_context: Option<&'a mut MidiContext>,
    audio_context: &'a mut AudioContext,
    processor: &'a mut SP,
    num_input_channels: usize,
    num_output_channels: usize,
    consumer: &'a mut Consumer<f32>,
    data: &'a mut [f32],
    audio_buffer: &'a mut AudioBuffer<f32>,
}

/// Tick one frame of the output stream.
///
/// This will be called repeatedly for every audio buffer we must produce.
fn output_stream_with_context<SP: StandaloneProcessor>(context: OutputStreamFrameContext<SP>) {
    let OutputStreamFrameContext {
        #[cfg(feature = "midi")]
        midi_context,
        audio_context,
        processor,
        num_input_channels,
        num_output_channels,
        consumer,
        data,
        audio_buffer,
    } = context;

    audio_buffer.resize(num_output_channels, data.len() / num_output_channels);
    audio_buffer.copy_from_interleaved(data);
    let on_under_run = || {
        // log::info!("INPUT UNDER-RUN");
    };

    for sample_num in 0..audio_buffer.num_samples() {
        if num_input_channels == num_output_channels {
            for channel_num in 0..audio_buffer.num_channels() {
                if let Some(input_sample) = consumer.pop() {
                    audio_buffer.channel_mut(channel_num)[sample_num] = input_sample;
                } else {
                    on_under_run();
                }
            }
        } else if let Some(input_sample) = consumer.pop() {
            // This only works if num_input_channels == 1
            for sample in 0..audio_buffer.num_channels() {
                let sample = &mut audio_buffer.channel_mut(sample)[sample_num];
                *sample = input_sample
            }
        } else {
            on_under_run();
        }
    }

    // Collect MIDI
    #[cfg(feature = "midi")]
    super::midi::flush_midi_events(midi_context, processor);

    processor.processor().process(audio_context, audio_buffer);

    audio_buffer.copy_into_interleaved(data);
}

#[cfg(test)]
mod test {
    use audio_processor_traits::{AudioBuffer, AudioProcessor};

    use crate::{StandaloneAudioOnlyProcessor, StandaloneProcessor};

    use super::*;

    #[test]
    fn test_tick_output_stream_reads_from_consumer_and_calls_process() {
        struct MockProcessor {
            inputs: Vec<f32>,
        }
        impl AudioProcessor for MockProcessor {
            type SampleType = f32;

            fn process(&mut self, _context: &mut AudioContext, data: &mut AudioBuffer<f32>) {
                for sample in data.channel_mut(0) {
                    self.inputs.push(*sample);
                    *sample *= 2.0;
                }
            }
        }

        let buf = ringbuf::RingBuffer::new(10);
        let (mut producer, mut consumer) = buf.split();
        let processor = MockProcessor { inputs: vec![] };
        let mut processor: StandaloneAudioOnlyProcessor<MockProcessor> =
            StandaloneAudioOnlyProcessor::new(processor, Default::default());

        for i in 0..10 {
            producer.push(i as f32).expect("Pushing sample failed");
        }

        let mut data = [0.0; 10];
        let mut buffer = AudioBuffer::empty();
        buffer.resize(1, 10);
        let context = OutputStreamFrameContext {
            processor: &mut processor,
            consumer: &mut consumer,
            num_output_channels: 1,
            num_input_channels: 1,
            #[cfg(feature = "midi")]
            midi_context: None,
            data: &mut data,
            audio_context: &mut Default::default(),
            audio_buffer: &mut buffer,
        };
        output_stream_with_context(context);

        assert_eq!(
            processor.processor().inputs,
            vec![0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]
        );
        assert_eq!(
            data,
            [0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0, 18.0]
        )
    }
}
