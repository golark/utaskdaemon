import 'package:grpc/grpc_web.dart';
import './protother/protother.pbgrpc.dart';

class GrpcClient {

  TasksClient client;  

  final channel = GrpcWebClientChannel.xhr(Uri.parse('http://localhost:8080'));

  GrpcClient() {
    client = TasksClient(channel);
  }

  pingServer() async {
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