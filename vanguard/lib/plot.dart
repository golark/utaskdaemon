import 'package:charts_flutter/flutter.dart' as charts;
import 'package:vanguard/colorprovider.dart';

// Point
// represents a single point on a plot
class Point{

  final String x;
  final int    y;
  final String colorCode;

  static const defaultColorCode = "#00A0B7";

  Point(this.x, this.y, {this.colorCode=defaultColorCode});

  charts.Color getColor() {
    return charts.Color.fromHex(code:colorCode);
  }
}


class Plot {

  List<Point> points = [];

}