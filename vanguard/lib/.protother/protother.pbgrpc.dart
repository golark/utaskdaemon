///
//  Generated code. Do not modify.
//  source: protother.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'protother.pb.dart' as $0;
export 'protother.pb.dart';

class PlotsClient extends $grpc.Client {
  static final _$getPoints = $grpc.ClientMethod<$0.PlotRequest, $0.Point>(
      '/protother.Plots/GetPoints',
      ($0.PlotRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Point.fromBuffer(value));
  static final _$newCommand =
      $grpc.ClientMethod<$0.CommandRequest, $0.CommandReply>(
          '/protother.Plots/NewCommand',
          ($0.CommandRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.CommandReply.fromBuffer(value));
  static final _$getOptions =
      $grpc.ClientMethod<$0.OptionsRequest, $0.OptionsReply>(
          '/protother.Plots/GetOptions',
          ($0.OptionsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.OptionsReply.fromBuffer(value));

  PlotsClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.Point> getPoints($0.PlotRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getPoints, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.CommandReply> newCommand($0.CommandRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$newCommand, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.OptionsReply> getOptions($0.OptionsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getOptions, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class PlotsServiceBase extends $grpc.Service {
  $core.String get $name => 'protother.Plots';

  PlotsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PlotRequest, $0.Point>(
        'GetPoints',
        getPoints_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.PlotRequest.fromBuffer(value),
        ($0.Point value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CommandRequest, $0.CommandReply>(
        'NewCommand',
        newCommand_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CommandRequest.fromBuffer(value),
        ($0.CommandReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OptionsRequest, $0.OptionsReply>(
        'GetOptions',
        getOptions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OptionsRequest.fromBuffer(value),
        ($0.OptionsReply value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Point> getPoints_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlotRequest> request) async* {
    yield* getPoints(call, await request);
  }

  $async.Future<$0.CommandReply> newCommand_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CommandRequest> request) async {
    return newCommand(call, await request);
  }

  $async.Future<$0.OptionsReply> getOptions_Pre(
      $grpc.ServiceCall call, $async.Future<$0.OptionsRequest> request) async {
    return getOptions(call, await request);
  }

  $async.Stream<$0.Point> getPoints(
      $grpc.ServiceCall call, $0.PlotRequest request);
  $async.Future<$0.CommandReply> newCommand(
      $grpc.ServiceCall call, $0.CommandRequest request);
  $async.Future<$0.OptionsReply> getOptions(
      $grpc.ServiceCall call, $0.OptionsRequest request);
}
