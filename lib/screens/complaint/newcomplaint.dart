import 'package:cricket/models/user.dart';
import 'package:cricket/screens/drawer/drawer.dart';
import 'package:cricket/services/database.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewComplaint extends StatefulWidget {
  NewComplaint({Key key, @required this.complaint}) : super(key: key);
  List<String> complaint = [];
  @override
  _NewComplaint createState() => _NewComplaint();
}

// ignore: camel_case_types
class _NewComplaint extends State<NewComplaint> {
  final myController = TextEditingController();
  final myConroller2 = TextEditingController();
  final myConroller3 = TextEditingController();
  final myController4 = TextEditingController();
  final myConroller5 = TextEditingController();
  final myConroller6 = TextEditingController();
  DateTime date;
  String date1;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _sendDataToNextScreen(BuildContext context) {
    // String texttosend = myConroller3.text;
    String textToSend = myController.text;
    List<String> b = [textToSend, date1];
    // widget.complaint.add(textToSend);
    //widget.complaint.add(date1);
    OurDatabase().newComplaint(b,context);

    if (widget.complaint != null) {
      widget.complaint.addAll(b);
    } else {
      widget.complaint = b;
    }

    print(b);
    Navigator.pop(context, widget.complaint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('New Complaints'),
      ),
      drawer: Mydrawer(),
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: myController,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Patient Name'),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: myConroller2,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Patient Address'),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: myController4,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Your Name '),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: myConroller5,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Your address'),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: myConroller6,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Your Phone Number'),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.black)),
                ),
              ),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  DateTime date = new DateTime.now();
                  date1 = date.toString();
                  print(date1);
                  _sendDataToNextScreen(context);
                },
              )
            ],
          ),
        ),
        //Text('patient name:-'),
      ),

      /* floatingActionButton: FloatingActionButton(
            // When the user presses the button, show an alert dialog containing
            // the text that the user has entered into the text field.
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Align(
                      child: Column(
                        children: [
                          Align(
                            child: Text(myController.text),
                          ),
                          Align(
                            child: Text(myConroller2.text),
                          ),
                          Align(
                            child: Text(myConroller3.text),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            tooltip: 'Show me the value!',
            child: Icon(Icons.text_fields),
          ),*/
    );
    // ignore: dead_code

    // ignore: dead_code
  }
}
