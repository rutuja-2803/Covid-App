import 'package:cricket/screens/drawer/drawer.dart';
import 'package:cricket/services/database.dart';
import 'package:cricket/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Mydieases extends StatefulWidget {
  Mydieases({Key key, @required this.dieas}) : super(key: key);
  List<String> dieas;
  @override
  _MydieasesState createState() => _MydieasesState();
}

class _MydieasesState extends State<Mydieases> {
  List<String> dieases = [];
  OurDatabase d = OurDatabase();


  int c = 1;

  void _addDieases(String dieasesName) {
    if (dieasesName.length > 0) {
      setState(() {
        dieases.add(dieasesName);
      });
    }
  }

  List<String> value = [];

  void initState() {
    // _read();
    dieases = widget.dieas;
    super.initState();
    Fluttertoast.showToast(
        msg: 'If you want delete some diseases Long press on delete icon,',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 7,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  Widget _buildDieasesList() {
    return new ListView.builder(
      // ignore: missing_return
      itemBuilder: (context, index) {
        if (index < dieases.length) {
          return _buildDieasesItem(dieases[index]);
        }
      },
    );
  }

  _onDeleteItem(String element) {
    setState(() {
      dieases.removeAt(dieases.indexOf(element));
    });

    //print(dieases);
    // dieases.removeWhere((elemen) => elemen == element);
    print('heelodcjsbcskjdc');
  }

  Widget _buildDieasesItem(String todoText) {
    return new ListTile(
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
                  child: Text(todoText),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(width: 1.0, color: Colors.black)),
            ),
          ),
        ],
      ),
      trailing: new IconButton(icon: new Icon(Icons.delete), onPressed: null),
      onLongPress: () {
        _onDeleteItem(todoText);
      },

      /*onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyDiet(
                      dieases: todoText,
                    )));
      },*/
    );
  }

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Diseases'),
        backgroundColor: Colors.black,
      ),
      drawer: Mydrawer(),
      body: Container(
        child: _buildDieasesList(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://digitalsynopsis.com/wp-content/uploads/2017/02/beautiful-color-gradients-backgrounds-049-fresh-milk.png"),
                fit: BoxFit.cover)),
      ),
      floatingActionButton: _getFAB(),
    );
  }

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Color(0xFF801E48),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: new Icon(Icons.add),
            backgroundColor: Colors.black,
            onTap: _pushAddDieasesScreen,
            label: 'Add',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFF801E48)),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.keyboard_backspace),
            backgroundColor: Colors.black,
            onTap: () {
              OurDatabase().createDisease(context,dieases);
              Navigator.pop(context, dieases);
            },
            label: 'back',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFF801E48))
      ],
    );
  }

  /* void databaseAddDisease() {
    print(dieases);
    OurDatabase d = OurDatabase();
    Future<String> a = d.addDisease(dieases);
  }*/

  String _chosenValue = 'Blood Pressure';

  void _pushAddDieasesScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://digitalsynopsis.com/wp-content/uploads/2017/02/beautiful-color-gradients-backgrounds-049-fresh-milk.png"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select your Disease',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
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
                            fontSize: 20,
                            /* backgroundColor: Colors.pinkAccent[200]*/
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        Navigator.pop(context);
                        _chosenValue = value;
                        _addDieases(value);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
