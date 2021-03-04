import 'package:cricket/screens/drawer/drawer.dart';
import 'package:cricket/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PlazmaDonor extends StatefulWidget {
  PlazmaDonor({Key key}) : super(key: key);

  @override
  _PlazmaDonorState createState() => _PlazmaDonorState();
}

class _PlazmaDonorState extends State<PlazmaDonor> {
  final name = TextEditingController();
  final city = TextEditingController();
  final days = TextEditingController();
  final mbo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plasma donor'),
      ),
      drawer: Mydrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 60,
              width: 500,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: name,
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.black)),
            ),
            Container(
              height: 60,
              width: 500,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: city,
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Enter your city',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.black)),
            ),
            Container(
              height: 60,
              width: 500,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: days,
                    decoration: new InputDecoration.collapsed(
                        hintText: 'How many days did you prevent the covid19',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.black)),
            ),
            Container(
              height: 60,
              width: 500,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mbo,
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.black)),
            ),
            Container(
              child: RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: 'Successfully Submitted',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 7,
                      backgroundColor: Colors.red,
                      textColor: Colors.yellow);

                  List<String> pla = [
                    name.text,
                    city.text,
                    days.text,
                    mbo.text
                  ];
                  Navigator.pop(context, pla);

                  OurDatabase().plasmadonor(context, pla);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
