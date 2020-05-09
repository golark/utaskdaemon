import 'package:flutter/material.dart';
import 'package:vanguard/grpcclient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(


        // top bar
        appBar: AppBar(
          title: Text('utasks'),
        ),

         // body
        body: bodyLayout(),
      ),


    );
  }
}

// bodyLayout
// consisting of listview and graph sections
Widget bodyLayout() {
  return Container(
    child: Row(children: <Widget>[


      // section 1 - list view
      Expanded(
        flex: 4,
        child: TaskListView(),
        ),

      // section 2 - graphs and analytics
      Expanded( 
        flex: 6,
        child: graphView(),
        ),

  
    ],),
    );
}

class TaskListView extends StatefulWidget {
  @override
  TaskListViewState createState() {
    return new TaskListViewState();
  }
}

class TaskListViewState extends State<TaskListView> {

  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         SizedBox(
              height: 600,
        child: myFutureListView(),),
        RaisedButton(
          child: Text('Press to add item'),
          onPressed: () {
            print('adding new item');

            GrpcClient grpcClient = new GrpcClient();
            grpcClient.pingServer();
            Future<List<Task>> tasksList = grpcClient.getTasks();

            tasksList.then((val) {
              print(val[0].getProjectName());

              setState(() {
                for(var i=0;i<val.length;++i){
                  tasks.add(val[i].getProjectName());
                }
              });


            });

          },
       ),
      ],); 
  }

  Widget myFutureListView() {
    GrpcClient grpcClient = new GrpcClient();

    return FutureBuilder(
      future: grpcClient.getTasks(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return ListView.builder (
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card (
                child:ListTile(
                  title: Text(snapshot.data[index].getProjectName())
                )
              );
            }
          );
        }
        return ListView.builder(
          itemCount: 0,
        );
      },
    
    );
  }



  Widget myListView() {
     return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile (
            leading: Icon(Icons.star),
            title: Text(tasks[index]),
            trailing: Icon(Icons.keyboard_arrow_right),


            onTap: () {
              print('on touch ' + index.toString());
            },


            onLongPress: () {
              setState(() {
                tasks.removeAt(index);
              });
            },


          ),
        );
      },
    );
  }
}

Widget graphView() {
  return Container(
    color: Colors.cyanAccent,
    child: Text('graph view'));  
}
