import 'package:charts_flutter/flutter.dart' as charts;

class TasksPerDay {
  final String date;
  final int count;

  TasksPerDay(this.date, this.count); 
}

class ProjectUTaskCount {
  final String projName;
  final int count;
  final charts.Color color;

  ProjectUTaskCount(this.projName, this.count, this.color);
}

class Task {

  String projectName;
  String taskName;
  String date;

  Task(this.projectName, this.taskName, this.date);
}