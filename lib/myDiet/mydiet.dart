import 'package:cricket/myDiet/Recipe.dart';
import 'package:cricket/screens/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDiet extends StatefulWidget {
  MyDiet({Key key, @required this.dieases}) : super(key: key);
  List<String> dieases = [];
  @override
  _MyDietState createState() => _MyDietState();
}

class _MyDietState extends State<MyDiet> {
  List<String> myDieases = [];
  void initState() {
    super.initState();
    for (var item in widget.dieases) {
      myDieases.addAll(allDieases[item]);
    }
  }

  var allDieases = {
    "Blood Pressure": [
      'Grilled egg plant and tomato pasta',
      'Chickpea and poatato curry'
    ],
    "Cardiac": ['dietplan'],
    "Diabetes": ['Broccoli with balsamic mushroom'],
    "Cancer": [
      'Rainbow buddha bowl with cashew tahini sauce',
      'spinach-avacado smoothie'
    ]
  };

  /*List<String> bp_instructor = [
        'Nilesh',
        'shubham',
      ],
      cancer_instructor = ['rutuja', 'pratik'],
      heart_dease_instructor = ['pratii'],
      sugar_instructor = ['sakshi'];*/
  Widget fun() {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.only(left: 10, top: 20),
          itemCount: myDieases.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: new Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            myDieases[index],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 1.0, color: Colors.black)),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Recipe(
                              name: myDieases[index],
                            )));
              },
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Recipe'),
      ),
      drawer: Mydrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://digitalsynopsis.com/wp-content/uploads/2017/02/beautiful-color-gradients-backgrounds-049-fresh-milk.png"),
                fit: BoxFit.cover)),
        child: Align(
          child: fun(),
        ),
      ),
    );
  }
}
