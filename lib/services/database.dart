
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket/models/group.dart';
import 'package:cricket/models/plasma.dart';
import 'package:cricket/models/user.dart';
import 'package:cricket/screens/profile/profile.dart';
import 'package:cricket/states/currentUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OurDatabase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference plasma = FirebaseFirestore.instance.collection('plasmadonors');
        


  String fullName;
  String email;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> plasmadonor(BuildContext context, List<String> plasma) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String x = _currentUser.getCurrentUser.uid;
DocumentReference _docRef = FirebaseFirestore.instance.collection("plasmadonors").doc();
print(_docRef);
    try {
      // diseases.add(diseaseName.toString());

      await _firestore.collection("plasmadonors").doc(x).set({
        'name': plasma[0],
        'city': plasma[1],
        'days': plasma[2],
        'mbo': plasma[3]
      });
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<double> profileDetails(
      BuildContext context, List<String> profile) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String x = _currentUser.getCurrentUser.uid;

    try {
      // diseases.add(diseaseName.toString());
      _firestore.collection("users").doc("INFO").collection("profile").add({
        "height": profile[0],
        'weight': profile[1],
        'bloodPressure': profile[2],
        'sugarLevel': profile[3],
        'heamoglobin':profile[4]
        
      });

    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String> createDisease(
    BuildContext context,
    List<String> diseaseName,
  ) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    List<String> diseases = List();
    String x = _currentUser.getCurrentUser.uid;

    try {
      diseases.add(diseaseName.toString());

      await _firestore.collection("users").doc(x).update({
        "diseases": FieldValue.arrayUnion(diseaseName),
      });

    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<String> newComplaint(List<String> dateName, context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String x = _currentUser.getCurrentUser.uid;

    OurUser user = OurUser();
    String retVal = "error";
    List<String> complaints = List();

    try {
      complaints.add(dateName.toString());
      // DocumentReference _docRef =
      //     await _firestore.collection("users").add({'diseases': diseaseName});

      await _firestore.collection("users").doc(x).update({
        "complaints": FieldValue.arrayUnion(dateName),
      });
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();

    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("users").doc(uid).get();
      retVal.uid = uid;
      retVal.fullName = _docSnapshot.data()["fullName"];
      fullName = _docSnapshot.data()["fullName"];
      email = retVal.email = _docSnapshot.data()["email"];

      retVal.email = _docSnapshot.data()["email"];
      retVal.accountCreated = _docSnapshot.data()["accountCreated"];
      print("fullisfjbsi ${retVal.fullName}");
      //  print("email ${email}");
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<Profile> getProfileInfo(BuildContext context) async {
    Profile pro = Profile();
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String x = _currentUser.getCurrentUser.uid;
    print(x);
    try {
      DocumentSnapshot _docSnapshot = _firestore
          .collection("users")
          .doc(x)
          .collection("profile")
          .get() as DocumentSnapshot;
      // await _firestore.collection("profile").doc(x).get();
      //await _firestore.collection("users").doc(x).get();
      //
      pro.height = _docSnapshot.data()["height"];
      pro.weight = _docSnapshot.data()["weight"];
      pro.bloodPressure = _docSnapshot.data()["bloodPressure"];
      print(pro.bloodPressure);
      pro.sugarLevel = _docSnapshot.data()["sugarLevel"];
      pro.heamoglobin = _docSnapshot.data()["haemoglobin"];
      print(pro.heamoglobin);
      // print("fullisfjbsi ${retVal.fullName}");
      //  print("email ${email}");
    } catch (e) {
      print(e);
    }

    //         .collection("users")
    //         .doc(result.id)
    //         .collection("profile")
    //         .get()
    //         .then((querySnapshot) {
    //       querySnapshot.docs.forEach((result) {
    //         print(result.data());
    //       });
    //     });
    //   });
    // });
  }

  Future<OurGroup> getGroupInfo(String groupId) async {
    OurGroup retVal = OurGroup();
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("groups").doc(groupId).get();
      retVal.id = groupId;
      retVal.name = _docSnapshot.data()["name"];
      retVal.leader = _docSnapshot.data()["leader"];
      retVal.members = List<String>.from(_docSnapshot.data()["members"]);
      retVal.groupCreated = _docSnapshot.data()["groupCreated"];
      retVal.currentMatchId = _docSnapshot.data()["currentMatchId"];
      retVal.currentMatchDue = _docSnapshot.data()["currentMatchDue"];
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<Plasma> getPlasmadonors(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String x = _currentUser.getCurrentUser.uid;
    Plasma d = Plasma();
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("plasmadonors").doc(x).get();
      print(x);
      print(d.name);
      print(d.city);
      print(d.mobileNo);
      d.name = _docSnapshot.data()["name"];
      d.city = _docSnapshot.data()["city"];
      d.mobileNo = _docSnapshot.data()["mbo"];
    } catch (e) {
      print(e);
    }
    return d;
  }
}
