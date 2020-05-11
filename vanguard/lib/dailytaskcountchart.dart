import 'package:flutter/material.dart';
import 'package:vanguard/grpcclient.dart';
import 'package:vanguard/progressindicator.dart';
import 'package:vanguard/utask.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Widget graphDailyTaskcount() {
  GrpcClient grpcClient = new GrpcClient();

  return FutureBuilder(
    future: grpcClient.getUtasksPerDay(),
    builder: (context, snapshot) {

      // chec if we have data
      if (snapshot.hasData) {
        List<TasksPerDay> dataUtask = [];
        for (var i = 0; i < snapshot.data.length; i++) {
          dataUtask
              .add(TasksPerDay(snapshot.data[i].date, snapshot.data[i].count));
        }

        var series = [
          new charts.Series(
            id: 'Clicks',
            domainFn: (TasksPerDay countData, _) => countData.date,
            measureFn: (TasksPerDay countData, _) => countData.count,
            data: dataUtask,
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
