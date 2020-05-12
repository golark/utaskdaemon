import 'package:charts_flutter/flutter.dart' as charts;
import 'package:vanguard/grpcclient.dart';
import './protother/protother.pbenum.dart';
import 'package:flutter/material.dart';
import 'package:vanguard/progressindicator.dart';
import 'package:vanguard/protother/protother.pbgrpc.dart';
import './protother/protother.pbgrpc.dart';

// Point
// represents a single point on a plot
class Point {
  final String x;
  final int y;
  final String colorCode;
  final String title;
  final String xLabel;
  final String yLabel;
  ChartType chartType;

  static const defaultColorCode = "#00A0B7";

  Point(this.x, this.y,
      {this.colorCode = defaultColorCode,
      this.chartType = ChartType.LINE_CHART,
      this.title="",
      this.xLabel="",
      this.yLabel=""});

  charts.Color getColor() {
    return charts.Color.fromHex(code: colorCode);
  }
}

typedef PlotFuncType = Future<List<Point>> Function();

Widget plotWidget(PlotFuncType plotFunc) {
  return FutureBuilder(
    future: plotFunc(),
    builder: (context, snapshot) {
      // step 1 - check if we have data
      if (snapshot.hasData) {
        // step - populate points with data from snapshot
        List<Point> points = [];
        for (var i = 0; i < snapshot.data.length; i++) {
          points.add(Point(snapshot.data[i].x, snapshot.data[i].y, chartType: snapshot.data[i].chartType, colorCode:  snapshot.data[i].colorCode));
        }

        var title = snapshot.data[0].title;
        var xLabel = snapshot.data[0].xLabel;
        var yLabel = snapshot.data[0].yLabel;

        // step - set series
        var series;
        if (snapshot.data[0].chartType == ChartType.LINE_CHART) {
          series = [
            new charts.Series(
              id: 'Clicks',
              domainFn: (Point point, _) => int.parse(point.x),
              measureFn: (Point point, _) => point.y,
              colorFn: (Point point, _) => point.getColor(),
              data: points,
            ),
          ];
        } else {
          series = [
            new charts.Series(
              id: 'Clicks',
              domainFn: (Point point, _) => point.x,
              measureFn: (Point point, _) => point.y,
              colorFn: (Point point, _) => point.getColor(),
              data: points,
            ),
          ];
        }

        // step - set behaviours
        var behaviours = [
          new charts.ChartTitle(title, // title
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.middle,
              innerPadding: 18),
          new charts.ChartTitle(yLabel, // yLabel
              behaviorPosition: charts.BehaviorPosition.start,
              titleOutsideJustification:
                  charts.OutsideJustification.middleDrawArea),
          new charts.ChartTitle(xLabel,  // xLabel
              behaviorPosition: charts.BehaviorPosition.bottom,
              titleOutsideJustification:
                  charts.OutsideJustification.middleDrawArea),
        ];

        // step - select chart type
        Widget chart;
        switch (snapshot.data[0].chartType) {
          case ChartType.BAR_CHART:
            chart = charts.BarChart(series, behaviors: behaviours);
            break;
          case ChartType.LINE_CHART:
            chart = charts.LineChart(series, behaviors: behaviours);
            break;
          case ChartType.PIE_CHART:
            chart = charts.PieChart(series, behaviors: behaviours);
            break;
          default: //unknown chart type
            break;
        }

        // return a container widget with the chart
        return Container(
            child: Padding(
                padding: EdgeInsets.all(32.0),
                child: SizedBox(height: 200.0, child: chart)));
      }

      // step - display a progress indicator while we wait for data
      return progressIndicator();
    },
  );
}
