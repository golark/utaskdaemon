import 'package:vanguard/grpcclient.dart';
import 'package:vanguard/progressindicator.dart';
import 'package:vanguard/utask.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:vanguard/colorprovider.dart';

Widget graphProjectTaskCount() {
  GrpcClient grpcClient = new GrpcClient();
  return FutureBuilder(
    future: grpcClient.getProjectTaskCount(),
    builder: (context, snapshot) {
      // check if we have data
      if (snapshot.hasData) {
        List<ProjectUTaskCount> projUtaskCount = [];
        for (var i = 0; i < snapshot.data.length; i++) {
          projUtaskCount.add(ProjectUTaskCount(
              snapshot.data[i].projName, snapshot.data[i].count, getColor(i)));
        }

        var series = [
          new charts.Series(
            id: 'Clicks',
            domainFn: (ProjectUTaskCount countData, _) => countData.projName,
            measureFn: (ProjectUTaskCount countData, _) => countData.count,
            colorFn: (ProjectUTaskCount countData, _) => countData.color,
            data: projUtaskCount,
          ),
        ];

        var chart = charts.PieChart(
          series,
          behaviors: [
            new charts.ChartTitle('Project Task Count',
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification: charts.OutsideJustification.middle,
                innerPadding: 18),
            new charts.DatumLegend(
              position: charts.BehaviorPosition.end,
              outsideJustification: charts.OutsideJustification.end,
              horizontalFirst: false,
              desiredMaxRows: 3,
              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
              entryTextStyle: charts.TextStyleSpec(
                  color: charts.MaterialPalette.purple.shadeDefault,
                  fontFamily: 'Georgia',
                  fontSize: 11),
            )
          ],
        );

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
