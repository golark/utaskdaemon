import 'package:vanguard/grpcclient.dart';
import 'package:vanguard/plot.dart';
import 'package:vanguard/protother/protother.pbgrpc.dart';

Future<List<Point>> projectTaskCountPlot() async {
  GrpcClient grpcClient = new GrpcClient();

  List<Point> points = [];

  var reqMessage = PlotRequest()..message = "ProjectCount";
  try {
    var respStream = grpcClient.client.getPlot(reqMessage);

    await for (var resp in respStream) {
      points.add(Point(resp.x, resp.y, chartType: resp.eChartType, title: resp.title, xLabel: resp.xLabel, yLabel: resp.yLabel, colorCode: resp.colorCode));
    }

    return points;
  } catch (e) {
    print('caught $e');
  }

  return null;
}
