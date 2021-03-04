import 'package:cricket/screens/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'newcomplaint.dart';
import 'yourComplaint.dart';

class MyComplaint extends StatefulWidget {
  MyComplaint({Key key, @required this.complaintList}) : super(key: key);
  List<String> complaintList = [];

  @override
  _MyComplaintState createState() => _MyComplaintState();
}

class _MyComplaintState extends State<MyComplaint> {
  String dateName = '';
  String date;
  List<String> a = [];
  void initState() {
    super.initState();
    a.addAll(widget.complaintList);
    print('complaint page list=$a');
  }

  @override
  Widget build(BuildContext context) {
    print('in build=$a');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Complaints'),
      ),
      drawer: Mydrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://digitalsynopsis.com/wp-content/uploads/2017/02/beautiful-color-gradients-backgrounds-049-fresh-milk.png"),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.fromLTRB(0, 290, 0, 0),
        child: Align(
          child: Align(
            child: Column(
              children: [
                Card(
                  //alignment: Alignment.bottomLeft,
                  child: new FlatButton(
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Yourcomplaint(
                                      dateName: dateName,
                                      dat: date,
                                      complaintList: a,
                                    )));
                      },
                      child: new Text('Your complaints!!')),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: new FlatButton(
                      onPressed: () async {
                        a = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewComplaint(
                                      complaint: a,
                                    )));
                        date = a[1];
                        dateName = a[0];
                        print(a);
                        //print(dateArray);
                      },
                      child: new Text('New complaints!!')),
                ),
              ],
            ),
          ),
        ),
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
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.keyboard_backspace),
            backgroundColor: Colors.black,
            onTap: () {
              // _save();
              Navigator.pop(context, a);
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
}
