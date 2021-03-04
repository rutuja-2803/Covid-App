import 'package:cricket/screens/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
 // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //var url = "https://covid19india.p.rapidapi.com/getIndiaStateData";
  String name = 'Nilesh walve';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: Mydrawer(),
      body: MyHome(),
    );
  }
}
