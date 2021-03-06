import 'package:grpc/grpc_web.dart';
import './protother/protother.pbgrpc.dart';
import 'package:vanguard/utask.dart';
import 'package:vanguard/plot.dart';

class GrpcClient {

  TasksClient client;  

  final channel = GrpcWebClientChannel.xhr(Uri.parse('http://localhost:8080'));

  GrpcClient() {
    client = TasksClient(channel);
  }

  Future<List<Task>> getTasks() async {

    List<Task> tasksList = [];

    try {
      if (this.client != null) {
        var respStream = client.getTasks(TaskRequest()..message="aloha");

        await for (var resp in respStream) {
          tasksList.add(Task(resp.project, resp.taskMane, resp.date));
        }

        return tasksList;
      }
    } catch (e) {
      print('caught $e');
    }

    return null;

  }

  Future pingServer() async {
    try {

      if (this.client != null) { 
        var response = await client.ping(PingRequest()..message="aloha");
        print('received response $response.greeting');
      } else {
        print('client is not initialised');
      }

    } catch(e) {
      print('caught $e');
    } 
  }

}