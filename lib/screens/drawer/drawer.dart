import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket/models/user.dart';
import 'package:cricket/myDiet/mydiet.dart';
import 'package:cricket/myDiet/nutrition.dart';
import 'package:cricket/screens/complaint/Complaint.dart';
import 'package:cricket/screens/coronaCenter/hosptal.dart';
import 'package:cricket/screens/disease/myDieases.dart';

import 'package:cricket/screens/home/home_page.dart';
import 'package:cricket/screens/home/signout.dart';
import 'package:cricket/screens/plasma/plazmaDonor.dart';

import 'package:cricket/screens/profile/myprofile.dart';
import 'package:cricket/screens/profile/profile.dart';
import 'package:cricket/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  FirebaseAuth auth = FirebaseAuth.instance;

  List<String> Dieasenames = [];

  List<String> ComplaintList = [];

  OurUser currentUser = OurUser();

  OurUser get getCurrentUser => currentUser;

  // FirebaseAuth auth = FirebaseAuth.instance;
  OurUser retVal = OurUser();
  String fullname, email;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<OurUser> getUserInfo(String uid) async {
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("users").doc(uid).get();
      retVal.uid = uid;
      retVal.fullName = _docSnapshot.data()["fullName"];
      setState(() {
        fullname = _docSnapshot.data()["fullName"];
        email = retVal.email = _docSnapshot.data()["email"];
      });

      retVal.email = _docSnapshot.data()["email"];
      retVal.accountCreated = _docSnapshot.data()["accountCreated"];
      print("getuserinfo  ${retVal.fullName}");
      //  print("email ${email}");
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> onStartUp() async {
    OurDatabase name = OurDatabase();
    try {
      // ignore: await_only_futures
      User _firebaseUser = await auth.currentUser;
      if (_firebaseUser != null) {
        currentUser = await getUserInfo(_firebaseUser.uid);

        //print('hello=${currentUser.fullName}${c++}');
      }
    } catch (e) {
      print(e);
    }
  }

  String uidname() {
    onStartUp();
    print('name=${currentUser.fullName}');
    return currentUser.fullName;
  }

  String uidEmail() {
    onStartUp();
    print('email=${currentUser.email}');
    return currentUser.email;
  }

  void initState() {
    onStartUp();
    super.initState();
  }

  var dict1 = {};
  List<String> plasma;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.cyan),
                accountName: Text(fullname.toString()),
                accountEmail: Text(email.toString())),

            //ITEMS OF LISTS......................................
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyHome()));
              },
            ),
            ListTile(
                leading: Icon(Icons.list_alt),
                title: Text('Details'),
                onTap: () async {
                  dict1 = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                  print(dict1);
                }),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text('My Profile'),
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyProfile(
                              profiledict: dict1,
                            )));
              },
            ),

            ListTile(
              leading: Icon(Icons.room_service),
              title: Text('Regular Diet'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodRestriction(
                              dieases: dict1,
                            )));
              },
            ),

            ListTile(
              leading: Icon(Icons.coronavirus),
              title: Text('Corona Center'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Hospital(),
                    ));
              },
            ),

            ListTile(
              leading: Icon(Icons.water_damage_outlined),
              title: Text('Plasma Providers Platform'),
              onTap: () async {
                plasma = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlazmaDonor()));
              },
            ),

            ListTile(
              leading: Icon(Icons.healing),
              title: Text('Sign Out'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignOut()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:cricket/myDiet/mydiet.dart';
// import 'package:cricket/screens/complaint/Complaint.dart';
// import 'package:cricket/screens/dosdont/FoodRestrictions.dart';
// import 'package:cricket/screens/profile/myprofile.dart';
// import 'package:cricket/screens/profile/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class Mydrawer extends StatelessWidget {
//   var Dieasenames = {};
//   List<String> ComplaintList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         color: Colors.white,
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.cyan,
//               ),
//               accountName: Text('Nilesh walve'),
//               accountEmail: Text('walven05@gmail.com'),
//               // arrowColor: Colors.deepOrange[200],

//               //currentAccountPicture: CircleAvatar(
//               // backgroundColor: Colors.red,
//               //),
//             ),

//             //ITEMS OF LISTS......................................
//             // ListTile(
//             //   leading: Icon(Icons.home),
//             //   title: Text('Home'),
//             //   onTap: () {
//             //     Navigator.push(
//             //         context, MaterialPageRoute(builder: (context) => MyHome()));
//             //   },
//             // ),

//             ListTile(
//                 leading: Icon(Icons.list_alt),
//                 title: Text('Details'),
//                 onTap: () async {
//                   Dieasenames = await Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Profile()));
//                   print('a=$Dieasenames');
//                 }),
//             ListTile(
//               leading: Icon(Icons.list_alt),
//               title: Text('My Profile'),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => MyProfile(
//                               profiledict: Dieasenames,
//                             )));
//               },
//             ),

//             ListTile(
//               leading: Icon(Icons.room_service),
//               title: Text('Regular Diet'),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => FoodRestriction(
//                              // dieases: Dieasenames,
//                             )));
//               },
//             ),

//             ListTile(
//               leading: Icon(Icons.coronavirus),
//               title: Text('Corona Center'),
//               onTap: () {},
//             ),

//             ListTile(
//               leading: Icon(Icons.history_edu),
//               title: Text('Complaints'),
//               onTap: () async {
//                 ComplaintList = await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => MyComplaint(
//                               complaintList: ComplaintList,
//                             )));
//                 print('list=$ComplaintList');
//               },
//             ),

//             ListTile(
//               leading: Icon(Icons.healing),
//               title: Text('Nearby Hospitals'),
//               onTap: () {},
//             ),

//             ListTile(
//               leading: Icon(Icons.receipt_rounded),
//               title: Text('Recipes'),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => MyDiet(
//                               dieases: Dieasenames["ListOfDieases"],
//                             )));
//               },
//             ),
//             // ListTile(
//             //   leading: Icon(Icons.qr_code),
//             //   title: Text('QR code'),
//             //   onTap: () {
//             //     Navigator.push(
//             //         context, MaterialPageRoute(builder: (context) => QRcode()));
//             //   },
//             // ),
// ListTile(
//   leading: Icon(Icons.water_damage_outlined),
//   title: Text('Plasma Providers Platform'),
//   onTap: () {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => Plasma()));
//   },
// ),
//             // ListTile(
//             //   leading: Icon(Icons.local_hospital),
//             //   title: Text('Dosage Tracker & AEFI alerts'),
//             //   onTap: () {
//             //     Navigator.push(
//             //         context, MaterialPageRoute(builder: (context) => Dosage()));
//             //   },
//             // ),
//             // ListTile(
//             //   leading: Icon(Icons.system_update),
//             //   title: Text('Traning Screen'),
//             //   onTap: () {
//             //     Navigator.push(context,
//             //         MaterialPageRoute(builder: (context) => Training()));
//             //   },
//             // ),
//             // ListTile(
//             //   leading: Icon(Icons.lock),
//             //   title: Text('Single Click Lockdown Screen(checkboxes)'),
//             //   onTap: () {
//             //     Navigator.push(
//             //         context, MaterialPageRoute(builder: (context) => QRcode()));
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
