import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class UtasksPerDay {
  final String date;
  final int count;

  UtasksPerDay(this.date, this.count); 
}

class ProjectUTaskCount {
  final String projName;
  final int count;
  final charts.Color color;

  ProjectUTaskCount(this.projName, this.count, this .color);
}