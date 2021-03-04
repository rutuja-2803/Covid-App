import 'dart:convert';

import 'package:cricket/screens/coronaCenter/hospitalinfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pay.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  var city = "Port Blair";
  Future<Welcome> _infoModel;
  void initState() {
    Future<Welcome> getdata() async {
      var infoModel = null;
      var res = await http
          .get("https://api.rootnet.in/covid19-in/hospitals/medical-colleges");
      if (res.statusCode == 200) {
        var jsonString = res.body;
        var jsonMap = json.decode(jsonString);
        infoModel = Welcome.fromJson(jsonMap);
      }
      return infoModel;
    }

    _infoModel = getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List of Hospitals"),
          backgroundColor: Colors.cyan,
        ),
        body: FutureBuilder<Welcome>(
          future: _infoModel,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.data.medicalColleges.length,
                itemBuilder: (context, index) {
                  var hos = snapshot.data.data.medicalColleges[index];
                  if (hos.city == "Mumbai") {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          children: [
                            Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 45,
                                width: 350,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    child: Text(
                                      '${hos.name}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Pay()));
                                    },
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                        child: Row(
                      children: [],
                    ));
                  }
                },
              );
            }
          },
        ));
  }
}
