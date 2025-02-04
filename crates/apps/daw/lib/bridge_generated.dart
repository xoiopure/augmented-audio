// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.62.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import 'dart:ffi' as ffi;

abstract class DawUi {
  Future<int> initializeLogger({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kInitializeLoggerConstMeta;

  Future<int> initializeAudio({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kInitializeAudioConstMeta;

  Future<int> startPlayback({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kStartPlaybackConstMeta;

  Future<int> stopPlayback({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kStopPlaybackConstMeta;

  Future<int> setVstFilePath({required String path, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSetVstFilePathConstMeta;

  Future<int> setInputFilePath({required String path, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSetInputFilePathConstMeta;

  Future<String> audioIoGetInputDevices({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAudioIoGetInputDevicesConstMeta;

  Stream<String> getEventsSink({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetEventsSinkConstMeta;

  Future<int> audioThreadSetOptions(
      {required String inputDeviceId,
      required String outputDeviceId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAudioThreadSetOptionsConstMeta;

  Future<int> audioGraphSetup({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAudioGraphSetupConstMeta;

  Future<Uint32List> audioGraphGetSystemIndexes({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAudioGraphGetSystemIndexesConstMeta;

  Future<int> audioGraphConnect(
      {required int inputIndex, required int outputIndex, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAudioGraphConnectConstMeta;

  Future<int> audioNodeCreate(
      {required String audioProcessorName, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAudioNodeCreateConstMeta;

  Future<int> audioNodeSetParameter(
      {required int audioNodeId,
      required String parameterName,
      required double parameterValue,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAudioNodeSetParameterConstMeta;
}

class DawUiImpl implements DawUi {
  final DawUiPlatform _platform;
  factory DawUiImpl(ExternalLibrary dylib) =>
      DawUiImpl.raw(DawUiPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory DawUiImpl.wasm(FutureOr<WasmModule> module) =>
      DawUiImpl(module as ExternalLibrary);
  DawUiImpl.raw(this._platform);
  Future<int> initializeLogger({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_initialize_logger(port_),
      parseSuccessData: _wire2api_i32,
      constMeta: kInitializeLoggerConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kInitializeLoggerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "initialize_logger",
        argNames: [],
      );

  Future<int> initializeAudio({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_initialize_audio(port_),
      parseSuccessData: _wire2api_i32,
      constMeta: kInitializeAudioConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kInitializeAudioConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "initialize_audio",
        argNames: [],
      );

  Future<int> startPlayback({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_start_playback(port_),
      parseSuccessData: _wire2api_i32,
      constMeta: kStartPlaybackConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kStartPlaybackConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "start_playback",
        argNames: [],
      );

  Future<int> stopPlayback({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_stop_playback(port_),
      parseSuccessData: _wire2api_i32,
      constMeta: kStopPlaybackConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kStopPlaybackConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "stop_playback",
        argNames: [],
      );

  Future<int> setVstFilePath({required String path, dynamic hint}) {
    var arg0 = _platform.api2wire_String(path);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_set_vst_file_path(port_, arg0),
      parseSuccessData: _wire2api_i32,
      constMeta: kSetVstFilePathConstMeta,
      argValues: [path],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSetVstFilePathConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "set_vst_file_path",
        argNames: ["path"],
      );

  Future<int> setInputFilePath({required String path, dynamic hint}) {
    var arg0 = _platform.api2wire_String(path);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_set_input_file_path(port_, arg0),
      parseSuccessData: _wire2api_i32,
      constMeta: kSetInputFilePathConstMeta,
      argValues: [path],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSetInputFilePathConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "set_input_file_path",
        argNames: ["path"],
      );

  Future<String> audioIoGetInputDevices({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_audio_io_get_input_devices(port_),
      parseSuccessData: _wire2api_String,
      constMeta: kAudioIoGetInputDevicesConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAudioIoGetInputDevicesConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "audio_io_get_input_devices",
        argNames: [],
      );

  Stream<String> getEventsSink({dynamic hint}) {
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_get_events_sink(port_),
      parseSuccessData: _wire2api_String,
      constMeta: kGetEventsSinkConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGetEventsSinkConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_events_sink",
        argNames: [],
      );

  Future<int> audioThreadSetOptions(
      {required String inputDeviceId,
      required String outputDeviceId,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(inputDeviceId);
    var arg1 = _platform.api2wire_String(outputDeviceId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_audio_thread_set_options(port_, arg0, arg1),
      parseSuccessData: _wire2api_i32,
      constMeta: kAudioThreadSetOptionsConstMeta,
      argValues: [inputDeviceId, outputDeviceId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAudioThreadSetOptionsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "audio_thread_set_options",
        argNames: ["inputDeviceId", "outputDeviceId"],
      );

  Future<int> audioGraphSetup({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_audio_graph_setup(port_),
      parseSuccessData: _wire2api_i32,
      constMeta: kAudioGraphSetupConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAudioGraphSetupConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "audio_graph_setup",
        argNames: [],
      );

  Future<Uint32List> audioGraphGetSystemIndexes({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_audio_graph_get_system_indexes(port_),
      parseSuccessData: _wire2api_uint_32_list,
      constMeta: kAudioGraphGetSystemIndexesConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAudioGraphGetSystemIndexesConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "audio_graph_get_system_indexes",
        argNames: [],
      );

  Future<int> audioGraphConnect(
      {required int inputIndex, required int outputIndex, dynamic hint}) {
    var arg0 = api2wire_u32(inputIndex);
    var arg1 = api2wire_u32(outputIndex);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_audio_graph_connect(port_, arg0, arg1),
      parseSuccessData: _wire2api_u32,
      constMeta: kAudioGraphConnectConstMeta,
      argValues: [inputIndex, outputIndex],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAudioGraphConnectConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "audio_graph_connect",
        argNames: ["inputIndex", "outputIndex"],
      );

  Future<int> audioNodeCreate(
      {required String audioProcessorName, dynamic hint}) {
    var arg0 = _platform.api2wire_String(audioProcessorName);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_audio_node_create(port_, arg0),
      parseSuccessData: _wire2api_u32,
      constMeta: kAudioNodeCreateConstMeta,
      argValues: [audioProcessorName],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAudioNodeCreateConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "audio_node_create",
        argNames: ["audioProcessorName"],
      );

  Future<int> audioNodeSetParameter(
      {required int audioNodeId,
      required String parameterName,
      required double parameterValue,
      dynamic hint}) {
    var arg0 = api2wire_i32(audioNodeId);
    var arg1 = _platform.api2wire_String(parameterName);
    var arg2 = api2wire_f32(parameterValue);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_audio_node_set_parameter(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_i32,
      constMeta: kAudioNodeSetParameterConstMeta,
      argValues: [audioNodeId, parameterName, parameterValue],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAudioNodeSetParameterConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "audio_node_set_parameter",
        argNames: ["audioNodeId", "parameterName", "parameterValue"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  int _wire2api_i32(dynamic raw) {
    return raw as int;
  }

  int _wire2api_u32(dynamic raw) {
    return raw as int;
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint32List _wire2api_uint_32_list(dynamic raw) {
    return raw as Uint32List;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }
}

// Section: api2wire

@protected
double api2wire_f32(double raw) {
  return raw;
}

@protected
int api2wire_i32(int raw) {
  return raw;
}

@protected
int api2wire_u32(int raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: finalizer

class DawUiPlatform extends FlutterRustBridgeBase<DawUiWire> {
  DawUiPlatform(ffi.DynamicLibrary dylib) : super(DawUiWire(dylib));

// Section: api2wire

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_String(String raw) {
    return api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }
// Section: finalizer

// Section: api_fill_to_wire
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class DawUiWire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  DawUiWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  DawUiWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Handle Function(ffi.UintPtr)>>(
          'get_dart_object');
  late final _get_dart_object =
      _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UintPtr)>>(
          'drop_dart_object');
  late final _drop_dart_object =
      _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr =
      _lookup<ffi.NativeFunction<ffi.UintPtr Function(ffi.Handle)>>(
          'new_dart_opaque');
  late final _new_dart_opaque =
      _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>(
          'init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_initialize_logger(
    int port_,
  ) {
    return _wire_initialize_logger(
      port_,
    );
  }

  late final _wire_initialize_loggerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_initialize_logger');
  late final _wire_initialize_logger =
      _wire_initialize_loggerPtr.asFunction<void Function(int)>();

  void wire_initialize_audio(
    int port_,
  ) {
    return _wire_initialize_audio(
      port_,
    );
  }

  late final _wire_initialize_audioPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_initialize_audio');
  late final _wire_initialize_audio =
      _wire_initialize_audioPtr.asFunction<void Function(int)>();

  void wire_start_playback(
    int port_,
  ) {
    return _wire_start_playback(
      port_,
    );
  }

  late final _wire_start_playbackPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_start_playback');
  late final _wire_start_playback =
      _wire_start_playbackPtr.asFunction<void Function(int)>();

  void wire_stop_playback(
    int port_,
  ) {
    return _wire_stop_playback(
      port_,
    );
  }

  late final _wire_stop_playbackPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_stop_playback');
  late final _wire_stop_playback =
      _wire_stop_playbackPtr.asFunction<void Function(int)>();

  void wire_set_vst_file_path(
    int port_,
    ffi.Pointer<wire_uint_8_list> path,
  ) {
    return _wire_set_vst_file_path(
      port_,
      path,
    );
  }

  late final _wire_set_vst_file_pathPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_uint_8_list>)>>('wire_set_vst_file_path');
  late final _wire_set_vst_file_path = _wire_set_vst_file_pathPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_set_input_file_path(
    int port_,
    ffi.Pointer<wire_uint_8_list> path,
  ) {
    return _wire_set_input_file_path(
      port_,
      path,
    );
  }

  late final _wire_set_input_file_pathPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_uint_8_list>)>>('wire_set_input_file_path');
  late final _wire_set_input_file_path = _wire_set_input_file_pathPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_audio_io_get_input_devices(
    int port_,
  ) {
    return _wire_audio_io_get_input_devices(
      port_,
    );
  }

  late final _wire_audio_io_get_input_devicesPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_audio_io_get_input_devices');
  late final _wire_audio_io_get_input_devices =
      _wire_audio_io_get_input_devicesPtr.asFunction<void Function(int)>();

  void wire_get_events_sink(
    int port_,
  ) {
    return _wire_get_events_sink(
      port_,
    );
  }

  late final _wire_get_events_sinkPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_get_events_sink');
  late final _wire_get_events_sink =
      _wire_get_events_sinkPtr.asFunction<void Function(int)>();

  void wire_audio_thread_set_options(
    int port_,
    ffi.Pointer<wire_uint_8_list> input_device_id,
    ffi.Pointer<wire_uint_8_list> output_device_id,
  ) {
    return _wire_audio_thread_set_options(
      port_,
      input_device_id,
      output_device_id,
    );
  }

  late final _wire_audio_thread_set_optionsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>>('wire_audio_thread_set_options');
  late final _wire_audio_thread_set_options =
      _wire_audio_thread_set_optionsPtr.asFunction<
          void Function(int, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>();

  void wire_audio_graph_setup(
    int port_,
  ) {
    return _wire_audio_graph_setup(
      port_,
    );
  }

  late final _wire_audio_graph_setupPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_audio_graph_setup');
  late final _wire_audio_graph_setup =
      _wire_audio_graph_setupPtr.asFunction<void Function(int)>();

  void wire_audio_graph_get_system_indexes(
    int port_,
  ) {
    return _wire_audio_graph_get_system_indexes(
      port_,
    );
  }

  late final _wire_audio_graph_get_system_indexesPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_audio_graph_get_system_indexes');
  late final _wire_audio_graph_get_system_indexes =
      _wire_audio_graph_get_system_indexesPtr.asFunction<void Function(int)>();

  void wire_audio_graph_connect(
    int port_,
    int input_index,
    int output_index,
  ) {
    return _wire_audio_graph_connect(
      port_,
      input_index,
      output_index,
    );
  }

  late final _wire_audio_graph_connectPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Uint32, ffi.Uint32)>>('wire_audio_graph_connect');
  late final _wire_audio_graph_connect =
      _wire_audio_graph_connectPtr.asFunction<void Function(int, int, int)>();

  void wire_audio_node_create(
    int port_,
    ffi.Pointer<wire_uint_8_list> audio_processor_name,
  ) {
    return _wire_audio_node_create(
      port_,
      audio_processor_name,
    );
  }

  late final _wire_audio_node_createPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_uint_8_list>)>>('wire_audio_node_create');
  late final _wire_audio_node_create = _wire_audio_node_createPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_audio_node_set_parameter(
    int port_,
    int _audio_node_id,
    ffi.Pointer<wire_uint_8_list> _parameter_name,
    double _parameter_value,
  ) {
    return _wire_audio_node_set_parameter(
      port_,
      _audio_node_id,
      _parameter_name,
      _parameter_value,
    );
  }

  late final _wire_audio_node_set_parameterPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Int32, ffi.Pointer<wire_uint_8_list>,
              ffi.Float)>>('wire_audio_node_set_parameter');
  late final _wire_audio_node_set_parameter =
      _wire_audio_node_set_parameterPtr.asFunction<
          void Function(int, int, ffi.Pointer<wire_uint_8_list>, double)>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_0(
    int len,
  ) {
    return _new_uint_8_list_0(
      len,
    );
  }

  late final _new_uint_8_list_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list_0');
  late final _new_uint_8_list_0 = _new_uint_8_list_0Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>(
          'free_WireSyncReturn');
  late final _free_WireSyncReturn =
      _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();
}

class _Dart_Handle extends ffi.Opaque {}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Bool Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
