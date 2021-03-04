import 'package:cricket/screens/drawer/drawer.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Yourcomplaint extends StatefulWidget {
  var dateName;

  Yourcomplaint(
      {Key key,
      @required this.dat,
      @required this.dateName,
      @required this.complaintList})
      : super(key: key);
  List<String> complaintList = [];
  var dat;
  @override
  _YourcomplaintState createState() => _YourcomplaintState();
}

class _YourcomplaintState extends State<Yourcomplaint> {
  var name = ['Nilesh', 'mangesh'];
  var date = ['1', '2'];
  var status = ['process', 'process'];
  void _incrementCounter() async {
    setState(() {
      //date.add(widget.dat);
      //name.add(widget.dateName);
      print('list1=${widget.complaintList}');
      print('comp' + widget.dat);
      print(widget.dateName);
      int c = 0;
      if (widget.complaintList != null) {
        for (var item in widget.complaintList) {
          if (c % 2 == 0) {
            name.add(item);
          } else {
            date.add(item);
          }
          status.add('process');
          c++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _incrementCounter();
    //tes=(prefs.getInt('counter') ?? 0) + 1;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Your Complaints'),
        ),
        drawer: Mydrawer(),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://digitalsynopsis.com/wp-content/uploads/2017/02/beautiful-color-gradients-backgrounds-049-fresh-milk.png"),
                  fit: BoxFit.cover)),
          child: ListView(children: <Widget>[
            Center(
                child: Text(
              'Complaint-Chart',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Date',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Status',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: List.generate(
                  name.length,
                  (index) => DataRow(cells: <DataCell>[
                        DataCell(Text(name[index])),
                        DataCell(Text(date[index].toString())),
                        DataCell(Text(status[index])),
                      ])),
            ),
          ]),
        ));
  }
}
