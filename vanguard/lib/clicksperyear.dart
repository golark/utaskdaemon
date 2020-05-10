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

  ProjectUTaskCount(this.projName, this.count, this.color);

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


}