///
//  Generated code. Do not modify.
//  source: protother.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ChartType$json = const {
  '1': 'ChartType',
  '2': const [
    const {'1': 'LINE_CHART', '2': 0},
    const {'1': 'PIE_CHART', '2': 1},
    const {'1': 'BAR_CHART', '2': 2},
  ],
};

const PingRequest$json = const {
  '1': 'PingRequest',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
  ],
};

const PingReply$json = const {
  '1': 'PingReply',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
  ],
};

const TaskRequest$json = const {
  '1': 'TaskRequest',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
  ],
};

const UTask$json = const {
  '1': 'UTask',
  '2': const [
    const {'1': 'TaskMane', '3': 1, '4': 1, '5': 9, '10': 'TaskMane'},
    const {'1': 'Project', '3': 2, '4': 1, '5': 9, '10': 'Project'},
    const {'1': 'Date', '3': 3, '4': 1, '5': 9, '10': 'Date'},
  ],
};

const DailyTaskCount$json = const {
  '1': 'DailyTaskCount',
  '2': const [
    const {'1': 'Date', '3': 1, '4': 1, '5': 9, '10': 'Date'},
    const {'1': 'Count', '3': 2, '4': 1, '5': 5, '10': 'Count'},
    const {'1': 'chartType', '3': 3, '4': 1, '5': 14, '6': '.protother.ChartType', '10': 'chartType'},
  ],
};

const ProjectTaskCount$json = const {
  '1': 'ProjectTaskCount',
  '2': const [
    const {'1': 'Project', '3': 1, '4': 1, '5': 9, '10': 'Project'},
    const {'1': 'Count', '3': 2, '4': 1, '5': 5, '10': 'Count'},
    const {'1': 'chartType', '3': 3, '4': 1, '5': 14, '6': '.protother.ChartType', '10': 'chartType'},
  ],
};

const PlotRequest$json = const {
  '1': 'PlotRequest',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
  ],
};

const PointReply$json = const {
  '1': 'PointReply',
  '2': const [
    const {'1': 'X', '3': 1, '4': 1, '5': 9, '10': 'X'},
    const {'1': 'Y', '3': 2, '4': 1, '5': 5, '10': 'Y'},
    const {'1': 'EChartType', '3': 3, '4': 1, '5': 14, '6': '.protother.ChartType', '10': 'EChartType'},
    const {'1': 'XLabel', '3': 4, '4': 1, '5': 9, '10': 'XLabel'},
    const {'1': 'YLabel', '3': 5, '4': 1, '5': 9, '10': 'YLabel'},
    const {'1': 'Title', '3': 6, '4': 1, '5': 9, '10': 'Title'},
  ],
};

