import 'package:flutter/material.dart';
import 'package:vanguard/grpcclient.dart';
import 'package:vanguard/clicksperyear.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
        child: Column(
          children: <Widget> [
            graphView(),
          ],
        ),
      ),


    ],),);
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
              height: 700,
        child: myFutureListView(),),
      ],); 
  }

  Widget myFutureListView() {
    GrpcClient grpcClient = new GrpcClient();

    return FutureBuilder(
      future: grpcClient.getTasks(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Container (
            child: ListView.builder (
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card (
                child:ListTile(
                  leading: Icon(Icons.star),
                  title: Text(snapshot.data[index].getProjectName()),
                  trailing: Icon(Icons.keyboard_arrow_right),


                  onTap: () {
                    print('on touch ' + index.toString());
                  },


                  onLongPress: () {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },


                )
              );
            }
            ),
          );
        }
        return Container(
          child: SizedBox(
                child: CircularProgressIndicator(),
                width: 10,
                height: 10,
              ),
        );
      },
    );
  }
}

Widget graphView() {

  GrpcClient grpcClient = new GrpcClient();

  var data = [
    new UtasksPerDay("11", 12),
    new UtasksPerDay("14", 12),
    new UtasksPerDay("13", 9),
  ];

    return FutureBuilder(
      future: grpcClient.getUtasksPerDay(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          
          List<UtasksPerDay> dataUtask = [];
          for(var i=0;i<snapshot.data.length;i++) {
            dataUtask.add(UtasksPerDay(snapshot.data[i].date, snapshot.data[i].count));
          }


          var series = [
            new charts.Series(
              id: 'Clicks',
              domainFn: (UtasksPerDay countData, _) => countData.date,
              measureFn: (UtasksPerDay countData, _) => countData.count,
              data: dataUtask,
              ),
          ];


          return Container (
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: SizedBox (
                height: 200.0,
                child: charts.BarChart(
                  series,
                )
              )

            ));
        }
        return Container(
          child: SizedBox(
                child: CircularProgressIndicator(),
                width: 10,
                height: 10,
              ),
        );
      },
    );
}
