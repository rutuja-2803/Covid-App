import 'dart:math';

import 'package:cricket/screens/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Recipe.dart';

class FoodRestriction extends StatefulWidget {
  FoodRestriction({Key key, @required this.dieases}) : super(key: key);
  Map dieases;
  @override
  _FoodRestrictionState createState() => _FoodRestrictionState();
}

class _FoodRestrictionState extends State<FoodRestriction> {
  String allDieasesNames;
  List<String> report;
  Widget toastfun(String toa) {
    Fluttertoast.showToast(
        msg: toa,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 7,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  String recipe;

  void initState() {
    super.initState();

    print(widget.dieases);
    if (widget.dieases["ListOfDieases"] != null) {
      double bplevel = double.parse(widget.dieases["bplevel"]);
      double sugarlevel = double.parse(widget.dieases["sugarlevel"]);
      double bloodlevel = double.parse(widget.dieases["bloodlevel"]);
      double bmi = int.parse(widget.dieases["weight"]) /
          pow(int.parse(widget.dieases["Height"]), 2);
      if (bmi > 30.0 &&
          bplevel > 180 &&
          sugarlevel > 150 &&
          bloodlevel < 12 &&
          widget.dieases["ListOfDieases"].contains("Blood Pressure") &&
          widget.dieases["ListOfDieases"].contains("Diabetes")) {
        toastfun('Weight status is obses');
        print('object');
        report = ['60', '2', '3', '4', '40'];
        recipe = 'Grilled egg plant and tomato pasta';
      } else if (bmi > 30.0 &&
          bplevel > 180 &&
          sugarlevel < 110 &&
          bloodlevel < 12 &&
          widget.dieases["ListOfDieases"].contains("Covid19") &&
          widget.dieases["ListOfDieases"].contains("cancer")) {
        toastfun('Weight status is obses');
        report = ['60', '2', '3', '4', '40'];
        recipe = 'Chickpea and poatato curry';
      } else if (bmi < 18.5 &&
          bplevel < 120 &&
          sugarlevel < 110 &&
          bloodlevel < 12 &&
          widget.dieases["ListOfDieases"].contains("cancer")) {
        toastfun('Weight status is under weight');
        report = ['60', '2', '3', '4', '40'];
        recipe = 'Rainbow buddha bowl with cashew tahini sauce';
      } else if (bmi < 18.5 &&
          bloodlevel < 120 &&
          sugarlevel < 110 &&
          bplevel < 12 &&
          widget.dieases["ListOfDieases"].contains("covid")) {
        toastfun('Weight status is under weight');
        report = ['60', '2', '3', '4', '40'];
        recipe = 'spinach-avacado smoothie';
      }
    }
  }

  var index1 = [
    'Proteins(gm) ',
    'Vitamin A(IU) ',
    'Vitamin D(IU) ',
    'Vitamin E(IU) ',
    'Calorirs '
  ];
  List finalList;

  @override
  Widget build(BuildContext context) {
    if (widget.dieases["ListOfDieases"] == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('My Diet'),
          backgroundColor: Colors.cyan,
        ),
        drawer: Mydrawer(),
        body: Center(child: Text('You did not filled your profile details..')),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('My Diet'),
            backgroundColor: Colors.cyan,
          ),
          drawer: Mydrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [proteinList(), button()],
            ),
          ));
    }
  }

  Widget button() {
    return RaisedButton(
        child: Text('dishes'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Recipe(
                        name: recipe,
                      )));
        });
  }

  Widget proteinList() {
    return new ListView.builder(
        shrinkWrap: true,
        itemCount: report.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${index1[index]}  ${report[index]}'),
                          ),
                        )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 2, color: Colors.black)),
                  ),
                ),
              ],
            ),
          );
          //_listprint('${index1[index]}  ${report[index]}');
        });
  }

  Widget _listprint(String todoText) {
    return new ListTile(
      title: new Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
            child: Container(
              height: 60,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(todoText),
                    ),
                  )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(width: 2, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
