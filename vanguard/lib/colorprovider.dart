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

class ColorGenerator {

  static final List<String> colorCodes = [ "#ff0000", "#f20000", "#a62929", "#401010", "#d9896c", "#593116", "#f2ceb6", "#cc6d00", 
                                  "#ffaa00", "#a68a53", "#403300", "#f2e63d", "#475900", "#86b32d", "#cef2b6", "#20f200", 
                                  "#003300", "#435943", "#1a6638", "#00e699", "#8fbfaf", "#00bfb3", "#13494d", "#008fb3", 
                                  "#3995e6", "#b6d6f2", "#4d5a66", "#3d6df2", "#1d3473", "#000099", "#8f8fbf", "#2d2040", 
                                  "#9d3df2", "#3c0059", "#770080", "#f279ea", "#f2b6de", "#73003d", "#bf307c", "#664d5a", 
                                  "#ff0044", "#f27989"];

  static String getColorCode(int index) {
    return colorCodes[index % colorCodes.length];
  }

}



