import 'package:flutter/material.dart';
import 'package:vanguard/grpcclient.dart';
import 'package:vanguard/progressindicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:vanguard/plot.dart';
import 'package:vanguard/protother/protother.pbgrpc.dart';

Widget graphDailyTaskcount() {
  GrpcClient grpcClient = new GrpcClient();

  return FutureBuilder(
    future: grpcClient.getUtasksPerDay(),
    builder: (context, snapshot) {
      // check if we have data
      if (snapshot.hasData) {
        List<Point> points = [];
        for (var i = 0; i < snapshot.data.length; i++) {
          points.add(Point(snapshot.data[i].x, snapshot.data[i].y));
        }

        var series;
        if (snapshot.data[0].chartType == ChartType.LINE_CHART) {
          series = [ new charts.Series(
            id: 'Clicks',
            domainFn: (Point point, _) => int.parse(point.x),
            measureFn: (Point point, _) => point.y,
            colorFn: (Point point, _) => point.getColor(),
            data: points,
          ),
        ];
        } else {
           series = [ new charts.Series(
            id: 'Clicks',
            domainFn: (Point point, _) => point.x,
            measureFn: (Point point, _) => point.y,
            colorFn: (Point point, _) => point.getColor(),
            data: points,
          ),
        ];         
        }


        var behaviours = [
          new charts.ChartTitle('Daily Task Count',
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.middle,
              innerPadding: 18),
          new charts.ChartTitle('Task Count',
              behaviorPosition: charts.BehaviorPosition.start,
              titleOutsideJustification:
                  charts.OutsideJustification.middleDrawArea),
        ];

        Widget chart;
        if (snapshot.data[0].chartType == ChartType.BAR_CHART) {
          chart = charts.BarChart(series, behaviors: behaviours);
        } else if(snapshot.data[0].chartType == ChartType.PIE_CHART) {
          chart = charts.PieChart(series, behaviors: behaviours);
        } else {
          chart = charts.LineChart(series, behaviors: behaviours);
        }

        // return a container widget
        return Container(
            child: Padding(
                padding: EdgeInsets.all(32.0),
                child: SizedBox(height: 200.0, child: chart)));
      }

      // waiting for data, display a progress indicator
      return progressIndicator();
    },
  );
}
