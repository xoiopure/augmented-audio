// = copyright ====================================================================
// Continuous: Live-looper and performance sampler
// Copyright (C) 2022  Pedro Tacla Yamada
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// = /copyright ===================================================================
//
//  File.swift
//
//
//  Created by Pedro Tacla Yamada on 12/3/2022.
//

import SwiftUI

extension Text {
    func monospacedDigitCompat() -> Text {
        if #available(macOS 12.0, *) {
            return self.monospacedDigit()
        } else {
            return self
        }
    }
}

struct TransportTempoView: View {
    @EnvironmentObject var store: Store
    @ObservedObject var timeInfo: TimeInfo

    @State var previousX = 0.0

    var body: some View {
        let content = self.getTextContent()

        HStack {
            Text(content)
                .monospacedDigitCompat()
                .gesture(DragGesture().onChanged { data in
                    var tempo = timeInfo.tempo ?? 120.0
                    let deltaX = data.translation.width - previousX
                    self.previousX = data.translation.width
                    tempo += Double(deltaX) / 100.0
                    store.setTempo(tempo: Float(tempo))
                }.onEnded { _ in
                    self.previousX = 0
                })
        }
        .padding(PADDING * 0.5)
        .background(SequencerColors.black3)
    }

    func getTextContent() -> String {
        if let tempo = timeInfo.tempo {
            return "\(String(format: "%.1f", tempo))bpm"
        } else {
            return "Free tempo"
        }
    }
}

struct TransportBeatsInnerView: View {
    var text: String
    var body: some View {
        Text(text)
            .monospacedDigitCompat()
    }
}

extension TransportBeatsInnerView: Equatable {}

struct TransportBeatsView: View {
    @ObservedObject var timeInfo: TimeInfo

    var body: some View {
        let text = getText()
        TransportBeatsInnerView(text: text)
            .equatable()
    }

    func getText() -> String {
        if let beats = timeInfo.positionBeats {
            return "\(String(format: "%.1f", 1.0 + Float(Int(beats * 10) % 40) / 10.0))"
        } else {
            return "0.0"
        }
    }
}

struct TransportControlsView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        HStack(alignment: .center) {
            TransportBeatsView(timeInfo: store.timeInfo).frame(width: 30, alignment: .trailing)

            Rectangle().fill(SequencerColors.black3).frame(width: 1.0, height: 10.0)

            Button(action: {
                store.onClickPlayheadPlay()
            }) {
                if #available(macOS 11.0, *) {
                    Image(systemName: "play.fill")
                        .renderingMode(.template)
                        .foregroundColor(store.isPlaying ? SequencerColors.green : SequencerColors.white)
                } else {
                    Text("Play")
                }
            }
            .buttonStyle(.plain)
            .frame(maxHeight: .infinity)
            .bindToParameterId(
                store: store,
                parameterId: .transportPlay,
                showSelectionOverlay: false
            )

            Button(action: {
                store.onClickPlayheadStop()
            }) {
                if #available(macOS 11.0, *) {
                    Image(systemName: "stop.fill")
                } else {
                    Text("Stop")
                }
            }
            .buttonStyle(.plain)
            .frame(maxHeight: .infinity)
            .bindToParameterId(
                store: store,
                parameterId: .transportStop,
                showSelectionOverlay: false
            )
        }
        .frame(maxHeight: 30)
    }
}
