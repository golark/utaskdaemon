import 'package:flutter/material.dart';

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
        child: UtaskListView(),
        ),

      // section 2 - graphs and analytics
      Expanded( 
        flex: 6,
        child: graphView(),
        ),

  
    ],),
    );
}


class UtaskListView extends StatelessWidget{

      // backing data
  final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria', 
        'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
        'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
        'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
        'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
        'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
        'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
        'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 
        'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];  


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: europeanCountries.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.star),
          title: Text(europeanCountries[index]),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },

    );
  }

}


Widget graphView() {
  return Container(
    color: Colors.cyanAccent,
    child: Text('graph view'));  
}
