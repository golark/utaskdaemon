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

class TasksClient extends $grpc.Client {
  static final _$getTasks = $grpc.ClientMethod<$0.TaskRequest, $0.UTask>(
      '/protother.Tasks/GetTasks',
      ($0.TaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UTask.fromBuffer(value));
  static final _$getDailyTaskCount =
      $grpc.ClientMethod<$0.TaskRequest, $0.DailyCount>(
          '/protother.Tasks/GetDailyTaskCount',
          ($0.TaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DailyCount.fromBuffer(value));
  static final _$ping = $grpc.ClientMethod<$0.PingRequest, $0.PingReply>(
      '/protother.Tasks/Ping',
      ($0.PingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PingReply.fromBuffer(value));

  TasksClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.UTask> getTasks($0.TaskRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getTasks, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseStream<$0.DailyCount> getDailyTaskCount($0.TaskRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getDailyTaskCount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.PingReply> ping($0.PingRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$ping, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class TasksServiceBase extends $grpc.Service {
  $core.String get $name => 'protother.Tasks';

  TasksServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TaskRequest, $0.UTask>(
        'GetTasks',
        getTasks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.TaskRequest.fromBuffer(value),
        ($0.UTask value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskRequest, $0.DailyCount>(
        'GetDailyTaskCount',
        getDailyTaskCount_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.TaskRequest.fromBuffer(value),
        ($0.DailyCount value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PingRequest, $0.PingReply>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PingRequest.fromBuffer(value),
        ($0.PingReply value) => value.writeToBuffer()));
  }

  $async.Stream<$0.UTask> getTasks_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TaskRequest> request) async* {
    yield* getTasks(call, await request);
  }

  $async.Stream<$0.DailyCount> getDailyTaskCount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TaskRequest> request) async* {
    yield* getDailyTaskCount(call, await request);
  }

  $async.Future<$0.PingReply> ping_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PingRequest> request) async {
    return ping(call, await request);
  }

  $async.Stream<$0.UTask> getTasks(
      $grpc.ServiceCall call, $0.TaskRequest request);
  $async.Stream<$0.DailyCount> getDailyTaskCount(
      $grpc.ServiceCall call, $0.TaskRequest request);
  $async.Future<$0.PingReply> ping(
      $grpc.ServiceCall call, $0.PingRequest request);
}
