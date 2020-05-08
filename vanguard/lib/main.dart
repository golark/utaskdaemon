import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  List<String> Tasks = ['T1', 'T2', 'T3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         SizedBox(
              height: 300,
        child: myListView(),),
        RaisedButton(
          child: Text('Press to add item'),
          onPressed: () {
            print('adding new item');
            setState(() {
              Tasks.add('new item');
            });
          },
       ),
      ],); 
  }

  Widget myListView() {
     return ListView.builder(
      itemCount: Tasks.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile (
            leading: Icon(Icons.star),
            title: Text(Tasks[index]),
            trailing: Icon(Icons.keyboard_arrow_right),


            onTap: () {
              setState(() {
                Tasks.add('a');
              });
              print('on touch ' + index.toString());
            },

            onLongPress: () {
              setState(() {
                Tasks.removeAt(index);
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