import 'dart:async';
import 'dart:convert';
import 'package:cricket/models/newsInfo.dart';
import 'package:cricket/screens/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Future<Welcome> _newsModel;
  void initState() {
    Future<Welcome> getdata() async {
      var newsModel = null;
      var res = await http.get("https://api.covid19india.org/data.json");
      if (res.statusCode == 200) {
        var jsonString = res.body;
        var jsonMap = json.decode(jsonString);
        newsModel = Welcome.fromJson(jsonMap);
      }
      return newsModel;
    }

    _newsModel = getdata();
    super.initState();
    setState(() {
      const oneSecond = const Duration(seconds: 1);
      new Timer.periodic(oneSecond, (Timer t) => Scaffold());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Covid Report of India'),
        backgroundColor: Colors.cyan,
      ),
      drawer: Mydrawer(),
      body: FutureBuilder<Welcome>(
        future: _newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.statewise.length,
                itemBuilder: (context, index) {
                  var statew = snapshot.data.statewise[index];

                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/originals/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg"),
                            fit: BoxFit.cover)),
                    height: 200,
                    width: 400,
                    child: Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 0,
                              color: Colors.transparent,
                              child: Container(
                                height: 100,
                                child: Align(
                                  // alignment: Alignment.bottomCenter,
                                  child: Text(
                                    '${statew.state}',
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      //decorationStyle: TextDecorationStyle.wavy,

                                      color: Colors.white,
                                      fontSize: 50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 0,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              child: Container(
                                //width: 230,
                                child: Align(
                                  child: Text(
                                    '''Confirmed Cases: ${statew.confirmed}\n\nActive Cases: ${statew.active}\n\nRecovered Cases: ${statew.recovered}\n\nDeaths: ${statew.deaths}''',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),

                            /*Align(
                              child: Text('Active cases is ${statew.active}:='),
                            ),
                            Align(
                              child: Text(
                                  'Recovered cases is ${statew.recovered}:='),
                            ),
                            Align(
                              child: Text('Death ${statew.deaths}:='),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
