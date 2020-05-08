///
//  Generated code. Do not modify.
//  source: protother.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Point extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Point', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..a<$core.int>(1, 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'y', $pb.PbFieldType.O3)
    ..aOS(3, 'label')
    ..hasRequiredFields = false
  ;

  Point._() : super();
  factory Point() => create();
  factory Point.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Point.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Point clone() => Point()..mergeFromMessage(this);
  Point copyWith(void Function(Point) updates) => super.copyWith((message) => updates(message as Point));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Point create() => Point._();
  Point createEmptyInstance() => create();
  static $pb.PbList<Point> createRepeated() => $pb.PbList<Point>();
  @$core.pragma('dart2js:noInline')
  static Point getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Point>(create);
  static Point _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
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
  $core.String get label => $_getSZ(2);
  @$pb.TagNumber(3)
  set label($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);
}

class PlotRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PlotRequest', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'reqMessage', protoName: 'reqMessage')
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
  $core.String get reqMessage => $_getSZ(0);
  @$pb.TagNumber(1)
  set reqMessage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReqMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearReqMessage() => clearField(1);
}

class CommandRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CommandRequest', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'message')
    ..a<$core.int>(2, 'numPoints', $pb.PbFieldType.O3, protoName: 'numPoints')
    ..hasRequiredFields = false
  ;

  CommandRequest._() : super();
  factory CommandRequest() => create();
  factory CommandRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommandRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CommandRequest clone() => CommandRequest()..mergeFromMessage(this);
  CommandRequest copyWith(void Function(CommandRequest) updates) => super.copyWith((message) => updates(message as CommandRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommandRequest create() => CommandRequest._();
  CommandRequest createEmptyInstance() => create();
  static $pb.PbList<CommandRequest> createRepeated() => $pb.PbList<CommandRequest>();
  @$core.pragma('dart2js:noInline')
  static CommandRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommandRequest>(create);
  static CommandRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get numPoints => $_getIZ(1);
  @$pb.TagNumber(2)
  set numPoints($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumPoints() => clearField(2);
}

class CommandReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CommandReply', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'message')
    ..hasRequiredFields = false
  ;

  CommandReply._() : super();
  factory CommandReply() => create();
  factory CommandReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommandReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CommandReply clone() => CommandReply()..mergeFromMessage(this);
  CommandReply copyWith(void Function(CommandReply) updates) => super.copyWith((message) => updates(message as CommandReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommandReply create() => CommandReply._();
  CommandReply createEmptyInstance() => create();
  static $pb.PbList<CommandReply> createRepeated() => $pb.PbList<CommandReply>();
  @$core.pragma('dart2js:noInline')
  static CommandReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommandReply>(create);
  static CommandReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class OptionsReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OptionsReply', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'plotType', protoName: 'plotType')
    ..aOS(2, 'titleText', protoName: 'titleText')
    ..aOS(3, 'xLabel', protoName: 'xLabel')
    ..aOB(4, 'xAxesDisplay', protoName: 'xAxesDisplay')
    ..aOS(5, 'yLabel', protoName: 'yLabel')
    ..aOB(6, 'yAxesDisplay', protoName: 'yAxesDisplay')
    ..aOS(7, 'color')
    ..aOB(8, 'gridOn', protoName: 'gridOn')
    ..hasRequiredFields = false
  ;

  OptionsReply._() : super();
  factory OptionsReply() => create();
  factory OptionsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OptionsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OptionsReply clone() => OptionsReply()..mergeFromMessage(this);
  OptionsReply copyWith(void Function(OptionsReply) updates) => super.copyWith((message) => updates(message as OptionsReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionsReply create() => OptionsReply._();
  OptionsReply createEmptyInstance() => create();
  static $pb.PbList<OptionsReply> createRepeated() => $pb.PbList<OptionsReply>();
  @$core.pragma('dart2js:noInline')
  static OptionsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OptionsReply>(create);
  static OptionsReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get plotType => $_getSZ(0);
  @$pb.TagNumber(1)
  set plotType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlotType() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlotType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get titleText => $_getSZ(1);
  @$pb.TagNumber(2)
  set titleText($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitleText() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitleText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get xLabel => $_getSZ(2);
  @$pb.TagNumber(3)
  set xLabel($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasXLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearXLabel() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get xAxesDisplay => $_getBF(3);
  @$pb.TagNumber(4)
  set xAxesDisplay($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasXAxesDisplay() => $_has(3);
  @$pb.TagNumber(4)
  void clearXAxesDisplay() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get yLabel => $_getSZ(4);
  @$pb.TagNumber(5)
  set yLabel($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasYLabel() => $_has(4);
  @$pb.TagNumber(5)
  void clearYLabel() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get yAxesDisplay => $_getBF(5);
  @$pb.TagNumber(6)
  set yAxesDisplay($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasYAxesDisplay() => $_has(5);
  @$pb.TagNumber(6)
  void clearYAxesDisplay() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get color => $_getSZ(6);
  @$pb.TagNumber(7)
  set color($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasColor() => $_has(6);
  @$pb.TagNumber(7)
  void clearColor() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get gridOn => $_getBF(7);
  @$pb.TagNumber(8)
  set gridOn($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasGridOn() => $_has(7);
  @$pb.TagNumber(8)
  void clearGridOn() => clearField(8);
}

class OptionsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OptionsRequest', package: const $pb.PackageName('protother'), createEmptyInstance: create)
    ..aOS(1, 'message')
    ..hasRequiredFields = false
  ;

  OptionsRequest._() : super();
  factory OptionsRequest() => create();
  factory OptionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OptionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OptionsRequest clone() => OptionsRequest()..mergeFromMessage(this);
  OptionsRequest copyWith(void Function(OptionsRequest) updates) => super.copyWith((message) => updates(message as OptionsRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionsRequest create() => OptionsRequest._();
  OptionsRequest createEmptyInstance() => create();
  static $pb.PbList<OptionsRequest> createRepeated() => $pb.PbList<OptionsRequest>();
  @$core.pragma('dart2js:noInline')
  static OptionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OptionsRequest>(create);
  static OptionsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

