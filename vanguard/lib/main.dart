import 'package:flutter/material.dart';
import 'package:vanguard/plot.dart';
import 'package:vanguard/tasklistwidget.dart';
import 'package:vanguard/dailytaskcountchart.dart';
import 'package:vanguard/projecttaskcountchart.dart';

void main() {
  runApp(UTaskApp());
}

class UTaskApp extends StatelessWidget {
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

        // body dashboard
        body: dashboard(),
      ),


    );
  }
}

// dashboard layout
Widget dashboard() {
  return Container(
    child: Row(
      children: dashboardWidgets,
    ),
  );
}

// dashboardWidgets
var dashboardWidgets = <Widget>[


  // section 1 - task list
  Expanded(
    flex: 4,
    child: TaskListView(),
  ),

  // section 2 - charts
  Expanded(
    flex: 6,
    child: Column(
      children: <Widget>[
        graphDailyTaskcount(),
        graphProjectTaskCount(),
        plotWidget(samplePlot),
      ],
    ),
  ),


];

