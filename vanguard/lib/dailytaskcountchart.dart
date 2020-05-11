import 'package:flutter/material.dart';
import 'package:vanguard/grpcclient.dart';
import 'package:vanguard/progressindicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:vanguard/plot.dart';

Widget graphDailyTaskcount() {
  GrpcClient grpcClient = new GrpcClient();

  return FutureBuilder(
    future: grpcClient.getUtasksPerDay(),
    builder: (context, snapshot) {
      // check if we have data
      if (snapshot.hasData) {
        List<Point> points = [];
        for (var i = 0; i < snapshot.data.length; i++) {
          points
              .add(Point(snapshot.data[i].x, snapshot.data[i].y));
        }

        var series = [
          new charts.Series(
            id: 'Clicks',
            domainFn: (Point point, _) => point.x,
            measureFn: (Point point, _) => point.y,
            colorFn: (Point point, _) => point.getColor(),
            data: points,
          ),
        ];

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

        // return a container widget
        return Container(
            child: Padding(
                padding: EdgeInsets.all(32.0),
                child: SizedBox(
                    height: 200.0,
                    child: charts.BarChart(
                      series,
                      behaviors: behaviours,
                    ))));
      }

      // waiting for data, display a progress indicator
      return progressIndicator();
    },
  );
}
