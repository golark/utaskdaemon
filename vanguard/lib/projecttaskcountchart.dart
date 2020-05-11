import 'package:vanguard/grpcclient.dart';
import 'package:vanguard/progressindicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:vanguard/colorgenerator.dart';
import 'package:vanguard/plot.dart';

Widget graphProjectTaskCount() {
  GrpcClient grpcClient = new GrpcClient();
  return FutureBuilder(
    future: grpcClient.getProjectTaskCount(),
    builder: (context, snapshot) {
      // check if we have data
      if (snapshot.hasData) {
        List<Point> points = [];
        for (var i = 0; i < snapshot.data.length; i++) {
          points.add(Point(
              snapshot.data[i].x, snapshot.data[i].y, colorCode: ColorGenerator.getColorCode(i)));
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
