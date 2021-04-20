// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:soccer_app/pagerbody.dart';
import 'api_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Text("SOCCERBOARD",
          style: TextStyle(color: Colors.black),
        ),
          centerTitle: true,
      ),
      body: FutureBuilder(
        future: SoccerApi().getAllMatches(), //calling our getData() method
        builder: (context, snapshot){
          if(snapshot.hasData){
            print(snapshot.data.length);
            return PageBody(snapshot.data);
          } else {
            return Center (
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
