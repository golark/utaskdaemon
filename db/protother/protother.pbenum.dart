///
//  Generated code. Do not modify.
//  source: protother.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ChartType extends $pb.ProtobufEnum {
  static const ChartType LINE_CHART = ChartType._(0, 'LINE_CHART');
  static const ChartType PIE_CHART = ChartType._(1, 'PIE_CHART');
  static const ChartType BAR_CHART = ChartType._(2, 'BAR_CHART');

  static const $core.List<ChartType> values = <ChartType> [
    LINE_CHART,
    PIE_CHART,
    BAR_CHART,
  ];

  static final $core.Map<$core.int, ChartType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChartType valueOf($core.int value) => _byValue[value];

  const ChartType._($core.int v, $core.String n) : super(v, n);
}

