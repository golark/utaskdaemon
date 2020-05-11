import 'package:flutter/material.dart';
import 'package:vanguard/grpcclient.dart';
import 'package:vanguard/progressindicator.dart';
import 'package:flutter/widgets.dart';

class TaskListView extends StatefulWidget {
  @override
  TaskListViewState createState() {
    return new TaskListViewState();
  }
}

class TaskListViewState extends State<TaskListView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 700,
          child: listViewBuilder(),
        ),
      ],
    );
  }

  Widget listViewBuilder() {
    GrpcClient grpcClient = new GrpcClient();

    return FutureBuilder(
      future: grpcClient.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: Icon(Icons.alarm),
                    title: Text(snapshot.data[index].projectName),
                    subtitle: Text(snapshot.data[index].taskName),
                  ));
                }),
          );
        }
        return progressIndicator();
      },
    );
  }
}
