///
//  Generated code. Do not modify.
//  source: protother.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PingRequest', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  PingRequest._() : super();
  factory PingRequest() => create();
  factory PingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PingRequest clone() => PingRequest()..mergeFromMessage(this);
  PingRequest copyWith(void Function(PingRequest) updates) => super.copyWith((message) => updates(message as PingRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PingRequest create() => PingRequest._();
  PingRequest createEmptyInstance() => create();
  static $pb.PbList<PingRequest> createRepeated() => $pb.PbList<PingRequest>();
  @$core.pragma('dart2js:noInline')
  static PingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingRequest>(create);
  static PingRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class PingReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PingReply', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  PingReply._() : super();
  factory PingReply() => create();
  factory PingReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PingReply clone() => PingReply()..mergeFromMessage(this);
  PingReply copyWith(void Function(PingReply) updates) => super.copyWith((message) => updates(message as PingReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PingReply create() => PingReply._();
  PingReply createEmptyInstance() => create();
  static $pb.PbList<PingReply> createRepeated() => $pb.PbList<PingReply>();
  @$core.pragma('dart2js:noInline')
  static PingReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingReply>(create);
  static PingReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class TaskRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TaskRequest', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  TaskRequest._() : super();
  factory TaskRequest() => create();
  factory TaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TaskRequest clone() => TaskRequest()..mergeFromMessage(this);
  TaskRequest copyWith(void Function(TaskRequest) updates) => super.copyWith((message) => updates(message as TaskRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskRequest create() => TaskRequest._();
  TaskRequest createEmptyInstance() => create();
  static $pb.PbList<TaskRequest> createRepeated() => $pb.PbList<TaskRequest>();
  @$core.pragma('dart2js:noInline')
  static TaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskRequest>(create);
  static TaskRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class UTask extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UTask', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'TaskMane', protoName: 'TaskMane')
    ..aOS(2, 'Project', protoName: 'Project')
    ..aOS(3, 'Date', protoName: 'Date')
    ..hasRequiredFields = false
  ;

  UTask._() : super();
  factory UTask() => create();
  factory UTask.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UTask.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UTask clone() => UTask()..mergeFromMessage(this);
  UTask copyWith(void Function(UTask) updates) => super.copyWith((message) => updates(message as UTask));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UTask create() => UTask._();
  UTask createEmptyInstance() => create();
  static $pb.PbList<UTask> createRepeated() => $pb.PbList<UTask>();
  @$core.pragma('dart2js:noInline')
  static UTask getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UTask>(create);
  static UTask _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskMane => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskMane($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskMane() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskMane() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get project => $_getSZ(1);
  @$pb.TagNumber(2)
  set project($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProject() => $_has(1);
  @$pb.TagNumber(2)
  void clearProject() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get date => $_getSZ(2);
  @$pb.TagNumber(3)
  set date($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);
}

