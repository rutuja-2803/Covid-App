import 'package:cricket/screens/drawer/drawer.dart';
import 'package:cricket/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  String height;
  String weight;
  String bloodPressure;
  String sugarLevel;
  String heamoglobin;
  List<String> pro = [];
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final height = TextEditingController();
  final weight = TextEditingController();
  final bplevel = TextEditingController();
  final sugarlevel = TextEditingController();
  final bloodlevel = TextEditingController();
  List<String> dieases = [];
  Profile details = new Profile();

  _onDeleteItem(String element) {
    setState(() {
      dieases.removeAt(dieases.indexOf(element));
    });
  }

  void _addDieases(String dieasesName) {
    if (dieasesName.length > 0) {
      setState(() {
        dieases.add(dieasesName);
      });
    }
  }

  var dict = {
    "ListOfDieases": [],
    "Height": 0,
    "weight": 0,
    "bplevel": 0,
    "bloodlevel": 0
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Details'),
          backgroundColor: Colors.cyan,
        ),
        drawer: Mydrawer(),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 60,
                width: 500,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: height,
                      decoration: new InputDecoration.collapsed(
                          hintText: 'Enter your Height'),
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
                      keyboardType: TextInputType.number,
                      controller: weight,
                      decoration: new InputDecoration.collapsed(
                          hintText: 'Enter your weight'),
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
                      keyboardType: TextInputType.number,
                      controller: bplevel,
                      decoration: new InputDecoration.collapsed(
                          hintText: 'Enter your Blood pressure level'),
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
                      keyboardType: TextInputType.number,
                      controller: sugarlevel,
                      decoration: new InputDecoration.collapsed(
                          hintText: 'Enter your Sugar level'),
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
                      keyboardType: TextInputType.number,
                      controller: bloodlevel,
                      decoration: new InputDecoration.collapsed(
                          hintText: 'Enter your hemoglobin'),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.black)),
              ),
              Align(
                child: Container(
                  child: _pushAddDieasesScreen(),
                ),
              ),
              Align(
                child: ListView.builder(
                  // ignore: missing_return
                  shrinkWrap: true,
                  // ignore: missing_return
                  itemBuilder: (context, index) {
                    if (index < dieases.length) {
                      return ListTile(
                        title: new Column(
                          children: [
                            Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(dieases[index]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: new IconButton(
                            icon: new Icon(Icons.delete), onPressed: null),
                        onLongPress: () {
                          _onDeleteItem(dieases[index]);
                        },
                      );
                    }
                  },
                ),
              ),
              Align(
                child: Container(
                    child: RaisedButton(
                  color: Colors.black,
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    print(weight.text);
                    // widget.pro.add(weight.text);

                    widget.pro.addAll([
                      height.text,
                      weight.text,
                      bplevel.text,
                      sugarlevel.text,
                      bloodlevel.text
                    ]);
                    OurDatabase().createDisease(context, dieases);
                    OurDatabase().profileDetails(context, widget.pro);
                    dict["ListOfDieases"] = dieases;
                    dict["Height"] = height.text;
                    dict["weight"] = weight.text;
                    dict["bplevel"] = bplevel.text;
                    dict["sugarlevel"] = sugarlevel.text;
                    dict["bloodlevel"] = bloodlevel.text;
                    Navigator.pop(context, dict);
                  },
                )),
              ),
            ],
          ),
        ));
  }

  String _chosenValue = 'Blood Pressure';

  Widget _pushAddDieasesScreen() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 9),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select your Disease',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  border: Border.all(width: 0, color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Align(
              widthFactor: 2,
              alignment: Alignment.topCenter,
              child: DropdownButton<String>(
                // isExpanded: true,

                value: _chosenValue,
                items: <String>[
                  'Blood Pressure',
                  'Diabetes',
                  'Cardiac',
                  'Cancer'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          // color: Colors.red[200],

                          /* backgroundColor: Colors.pinkAccent[200]*/
                          ),
                    ),
                  );
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    _chosenValue = value;
                    _addDieases(value);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
