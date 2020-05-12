///
//  Generated code. Do not modify.
//  source: protother.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'protother.pbenum.dart';

export 'protother.pbenum.dart';

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

class DailyTaskCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DailyTaskCount', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'Date', protoName: 'Date')
    ..a<$core.int>(2, 'Count', $pb.PbFieldType.O3, protoName: 'Count')
    ..e<ChartType>(3, 'chartType', $pb.PbFieldType.OE, protoName: 'chartType', defaultOrMaker: ChartType.LINE_CHART, valueOf: ChartType.valueOf, enumValues: ChartType.values)
    ..hasRequiredFields = false
  ;

  DailyTaskCount._() : super();
  factory DailyTaskCount() => create();
  factory DailyTaskCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DailyTaskCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DailyTaskCount clone() => DailyTaskCount()..mergeFromMessage(this);
  DailyTaskCount copyWith(void Function(DailyTaskCount) updates) => super.copyWith((message) => updates(message as DailyTaskCount));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DailyTaskCount create() => DailyTaskCount._();
  DailyTaskCount createEmptyInstance() => create();
  static $pb.PbList<DailyTaskCount> createRepeated() => $pb.PbList<DailyTaskCount>();
  @$core.pragma('dart2js:noInline')
  static DailyTaskCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DailyTaskCount>(create);
  static DailyTaskCount _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get date => $_getSZ(0);
  @$pb.TagNumber(1)
  set date($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);

  @$pb.TagNumber(3)
  ChartType get chartType => $_getN(2);
  @$pb.TagNumber(3)
  set chartType(ChartType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChartType() => $_has(2);
  @$pb.TagNumber(3)
  void clearChartType() => clearField(3);
}

class ProjectTaskCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ProjectTaskCount', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'Project', protoName: 'Project')
    ..a<$core.int>(2, 'Count', $pb.PbFieldType.O3, protoName: 'Count')
    ..e<ChartType>(3, 'chartType', $pb.PbFieldType.OE, protoName: 'chartType', defaultOrMaker: ChartType.LINE_CHART, valueOf: ChartType.valueOf, enumValues: ChartType.values)
    ..hasRequiredFields = false
  ;

  ProjectTaskCount._() : super();
  factory ProjectTaskCount() => create();
  factory ProjectTaskCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectTaskCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ProjectTaskCount clone() => ProjectTaskCount()..mergeFromMessage(this);
  ProjectTaskCount copyWith(void Function(ProjectTaskCount) updates) => super.copyWith((message) => updates(message as ProjectTaskCount));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProjectTaskCount create() => ProjectTaskCount._();
  ProjectTaskCount createEmptyInstance() => create();
  static $pb.PbList<ProjectTaskCount> createRepeated() => $pb.PbList<ProjectTaskCount>();
  @$core.pragma('dart2js:noInline')
  static ProjectTaskCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectTaskCount>(create);
  static ProjectTaskCount _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get project => $_getSZ(0);
  @$pb.TagNumber(1)
  set project($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProject() => $_has(0);
  @$pb.TagNumber(1)
  void clearProject() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);

  @$pb.TagNumber(3)
  ChartType get chartType => $_getN(2);
  @$pb.TagNumber(3)
  set chartType(ChartType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChartType() => $_has(2);
  @$pb.TagNumber(3)
  void clearChartType() => clearField(3);
}

class PlotRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PlotRequest', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  PlotRequest._() : super();
  factory PlotRequest() => create();
  factory PlotRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlotRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PlotRequest clone() => PlotRequest()..mergeFromMessage(this);
  PlotRequest copyWith(void Function(PlotRequest) updates) => super.copyWith((message) => updates(message as PlotRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlotRequest create() => PlotRequest._();
  PlotRequest createEmptyInstance() => create();
  static $pb.PbList<PlotRequest> createRepeated() => $pb.PbList<PlotRequest>();
  @$core.pragma('dart2js:noInline')
  static PlotRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlotRequest>(create);
  static PlotRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class PointReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PointReply', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'X', protoName: 'X')
    ..a<$core.int>(2, 'Y', $pb.PbFieldType.O3, protoName: 'Y')
    ..e<ChartType>(3, 'EChartType', $pb.PbFieldType.OE, protoName: 'EChartType', defaultOrMaker: ChartType.LINE_CHART, valueOf: ChartType.valueOf, enumValues: ChartType.values)
    ..aOS(4, 'XLabel', protoName: 'XLabel')
    ..aOS(5, 'YLabel', protoName: 'YLabel')
    ..aOS(6, 'Title', protoName: 'Title')
    ..aOS(7, 'ColorCode', protoName: 'ColorCode')
    ..hasRequiredFields = false
  ;

  PointReply._() : super();
  factory PointReply() => create();
  factory PointReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PointReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PointReply clone() => PointReply()..mergeFromMessage(this);
  PointReply copyWith(void Function(PointReply) updates) => super.copyWith((message) => updates(message as PointReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PointReply create() => PointReply._();
  PointReply createEmptyInstance() => create();
  static $pb.PbList<PointReply> createRepeated() => $pb.PbList<PointReply>();
  @$core.pragma('dart2js:noInline')
  static PointReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointReply>(create);
  static PointReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get x => $_getSZ(0);
  @$pb.TagNumber(1)
  set x($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  ChartType get eChartType => $_getN(2);
  @$pb.TagNumber(3)
  set eChartType(ChartType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEChartType() => $_has(2);
  @$pb.TagNumber(3)
  void clearEChartType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get xLabel => $_getSZ(3);
  @$pb.TagNumber(4)
  set xLabel($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasXLabel() => $_has(3);
  @$pb.TagNumber(4)
  void clearXLabel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get yLabel => $_getSZ(4);
  @$pb.TagNumber(5)
  set yLabel($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasYLabel() => $_has(4);
  @$pb.TagNumber(5)
  void clearYLabel() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get colorCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set colorCode($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasColorCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearColorCode() => clearField(7);
}

