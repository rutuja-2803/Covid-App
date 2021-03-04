import 'package:flutter/material.dart';
class Pay extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.amber[80],
      appBar: AppBar(
        title: Text("Book an Appointment"),
        backgroundColor: Colors.cyan,
      ),
      body: profileView()
    );
  }
}
final name = TextEditingController();
final Phone = TextEditingController();
final Address = TextEditingController();
final Email = TextEditingController();

Widget profileView() {

    return Column(
      children: <Widget>[        
        Expanded(child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: name,
                        decoration: new InputDecoration.collapsed(hintText: 'Select Date'),
                      ),
                    ),
                  ), decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
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
                        controller: Phone,
                        decoration: new InputDecoration.collapsed(hintText: 'Name'),
                      ),
                    ),
                  ), decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
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
                        controller: Address,
                        decoration: new InputDecoration.collapsed(hintText: 'Phone Number'),
                      ),
                    ),
                  ), decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
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
                        controller: Email,
                        decoration: new InputDecoration.collapsed(hintText: 'Address'),
                      ),
                    ),
                  ), decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
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
                        controller: Email,
                        decoration: new InputDecoration.collapsed(hintText: 'Email Address'),
                      ),
                    ),
                  ), decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container( height: 70, width: 200,
                    child: Align(child: Text('BOOK NOW', style: TextStyle(color: Colors.black, fontSize: 20),),),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      
                    ),),),
              )
            ],
          ),
        ))
      ],
    );
  }