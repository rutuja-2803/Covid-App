import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket/models/profile.dart';
import 'package:cricket/models/user.dart';
import 'package:cricket/screens/drawer/drawer.dart';
import 'package:cricket/services/database.dart';
import 'package:cricket/states/currentUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key key, @required this.profiledict}) : super(key: key);
  var profiledict;

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  OurUser currentUser = OurUser();

  OurUser get getCurrentUser => currentUser;
  final DocumentReference documentReference =
      FirebaseFirestore.instance.doc("users/INFO");

  OurUser retVal = OurUser();
  List<String> profile;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //  retVal.profile = _docSnapshot.data()["email"];
  // retVal.accountCreated = _docSnapshot.data()["accountCreated"];
  // print("getuserinfo  ${retVal.fullName}");
  //  print("email ${email}");

  @override
  void initState() {
    super.initState();
    OurDatabase().getProfileInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String x = _currentUser.getCurrentUser.uid;

    CollectionReference profile = FirebaseFirestore.instance
        .collection('users')
        .doc(x)
        .collection("profile");

      if (widget.profiledict["ListOfDieases"] == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          backgroundColor: Colors.cyan,
        ),
        drawer: Mydrawer(),
        body: Center(
            child: Text(
          'You did not filled your profile details..',
          style: TextStyle(fontSize: 20),
        )),
      );
    }else{
 return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(),
        ),
        backgroundColor: Colors.cyan,
      ),
      drawer: Mydrawer(),
      body: Column(
        children: [
          Container(
            height: 60,
            width: 500,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Height  ${widget.profiledict["Height"]}m'),
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
                child: Text('Weight ${widget.profiledict["weight"]}kg'),
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
                child: Text(
                    'Blood Pressure level ${widget.profiledict["bplevel"]}'),
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
                child: Text('Hemoglobin ${widget.profiledict["bloodlevel"]} '),
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
                child: Text('Sugar level ${widget.profiledict["sugarlevel"]}'),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.black)),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Your Diseases:',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              )),
          Align(
              child: ListView.builder(
                // ignore: missing_return
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index < widget.profiledict["ListOfDieases"].length) {
                    return ListTile(
                      title: new Column(
                        children: [
                          Container(
                            height: 60,
                            width: 500,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    widget.profiledict["ListOfDieases"][index]),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0, color: Colors.black)),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
    }
   
  }
}
//}
