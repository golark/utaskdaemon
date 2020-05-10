import 'package:flutter/material.dart';
import 'package:vanguard/grpcclient.dart';
import 'package:vanguard/clicksperyear.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        // top bar
        appBar: AppBar(
          title: Text('utasks'),
        ),

        // body
        body: bodyLayout(),
      ),
    );
  }
}

// bodyLayout
// consisting of listview and graph sections
Widget bodyLayout() {
  return Container(
    child: Row(
      children: <Widget>[
        // section 1 - list view
        Expanded(
          flex: 4,
          child: TaskListView(),
        ),

        // section 2 - graphs and analytics
        Expanded(
          flex: 6,
          child: Column(
            children: <Widget>[
              graphDailyTaskcount(),
              graphProjectTaskCount(),
            ],
          ),
        ),
      ],
    ),
  );
}

class TaskListView extends StatefulWidget {
  @override
  TaskListViewState createState() {
    return new TaskListViewState();
  }
}

class TaskListViewState extends State<TaskListView> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 700,
          child: myFutureListView(),
        ),
      ],
    );
  }

  Widget myFutureListView() {
    GrpcClient grpcClient = new GrpcClient();

    return FutureBuilder(
      future: grpcClient.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: Icon(Icons.alarm),
                    title: Text(snapshot.data[index].getProjectName()),
                    subtitle: Text(snapshot.data[index].taskName),
                    onTap: () {
                      print('on touch ' + index.toString());
                    },
                    onLongPress: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                  ));
                }),
          );
        }
        return Container(
          child: SizedBox(
            child: CircularProgressIndicator(),
            width: 10,
            height: 10,
          ),
        );
      },
    );
  }
}

Widget graphDailyTaskcount() {
  GrpcClient grpcClient = new GrpcClient();

  return FutureBuilder(
    future: grpcClient.getUtasksPerDay(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<UtasksPerDay> dataUtask = [];
        for (var i = 0; i < snapshot.data.length; i++) {
          dataUtask
              .add(UtasksPerDay(snapshot.data[i].date, snapshot.data[i].count));
        }

        var series = [
          new charts.Series(
            id: 'Clicks',
            domainFn: (UtasksPerDay countData, _) => countData.date,
            measureFn: (UtasksPerDay countData, _) => countData.count,
            data: dataUtask,
          ),
        ];

        return Container(
            child: Padding(
                padding: EdgeInsets.all(32.0),
                child: SizedBox(
                    height: 200.0,
                    child: charts.BarChart(series, behaviors: [
                      new charts.ChartTitle('Daily Task Count',
                          behaviorPosition: charts.BehaviorPosition.top,
                          titleOutsideJustification:
                              charts.OutsideJustification.middle,
                          innerPadding: 18),
                      new charts.ChartTitle('Task Count',
                          behaviorPosition: charts.BehaviorPosition.start,
                          titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                    ]))));
      }
      return Container(
        child: SizedBox(
          child: CircularProgressIndicator(),
          width: 10,
          height: 10,
        ),
      );
    },
  );
}

  final List<charts.Color> colors = [
    charts.MaterialPalette.blue.shadeDefault,
    charts.MaterialPalette.cyan.shadeDefault,
    charts.MaterialPalette.deepOrange.shadeDefault,
    charts.MaterialPalette.indigo.shadeDefault,
    charts.MaterialPalette.purple.shadeDefault,
    charts.MaterialPalette.teal.shadeDefault,
    charts.MaterialPalette.yellow.shadeDefault,
    charts.MaterialPalette.lime.shadeDefault,
    charts.MaterialPalette.pink.shadeDefault,
    charts.MaterialPalette.green.shadeDefault,
    ];


  charts.Color getColor(int index) {
    return colors[index%colors.length];
  }


Widget graphProjectTaskCount() {
  GrpcClient grpcClient = new GrpcClient();
  return FutureBuilder(
    future: grpcClient.getProjectTaskCount(),
    builder: (context, snapshot) {
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

        return Container(
            child: Padding(
                padding: EdgeInsets.all(32.0),
                child: SizedBox(
                    height: 200.0,
                    child: charts.PieChart(
                      series,
                      behaviors: [
                        new charts.ChartTitle('Project Task Count',
                            behaviorPosition: charts.BehaviorPosition.top,
                            titleOutsideJustification:
                                charts.OutsideJustification.middle,
                            innerPadding: 18),
                        new charts.DatumLegend(
                          position: charts.BehaviorPosition.end,
                          outsideJustification:
                              charts.OutsideJustification.end,
                          horizontalFirst: false,
                          desiredMaxRows: 3,
                          cellPadding:
                              new EdgeInsets.only(right: 4.0, bottom: 4.0),
                          entryTextStyle: charts.TextStyleSpec(
                              color: charts.MaterialPalette.purple.shadeDefault,
                              fontFamily: 'Georgia',
                              fontSize: 11),
                        )
                      ],
                    ))));
      }
      return Container(
        child: SizedBox(
          child: CircularProgressIndicator(),
          width: 10,
          height: 10,
        ),
      );
    },
  );
}
