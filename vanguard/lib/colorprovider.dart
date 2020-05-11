import 'package:charts_flutter/flutter.dart' as charts;

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
  return colors[index % colors.length];
}

