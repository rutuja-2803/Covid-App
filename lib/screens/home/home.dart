
import 'package:cricket/screens/home/mainclass.dart';
import 'package:cricket/screens/root/root.dart';
import 'package:cricket/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


    
 

  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signOut();
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => OurRoot(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
      // body: ListView(
      //   children: <Widget>[
      //     // SizedBox(
      //     //   height: 40,
      //     // ),
      //     // Padding(
      //     //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
      //     //   child: RaisedButton(
      //     //     child: Text("Sign Out"),
      //     //     onPressed: () => _signOut(context),
      //     //     color: Theme.of(context).canvasColor,
      //     //     shape: RoundedRectangleBorder(
      //     //         borderRadius: BorderRadius.circular(20.0),
      //     //         side: BorderSide(
      //     //             color: Theme.of(context).secondaryHeaderColor, width: 2)),
      //     //   ),
      //     //  )
      //   ],
      // ),
    );
  }
}
