import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String height;
  String weight;
  String bloodPressure;
  String sugarLevel;
  String heamoglobin;
//  Timestamp accountCreated;

  Profile({
    this.height,
    this.weight,
    this.bloodPressure,
    this.heamoglobin,
    this.sugarLevel,
  });

  Profile.fromDocumentSnapshot({DocumentSnapshot doc}) {
    height = doc.data()['height'];
    weight = doc.data()['weight'];
    bloodPressure = doc.data()['bloodPressure'];
    sugarLevel = doc.data()['sugarLevel'];
    heamoglobin = doc.data()['haemoglobin'];
  }
}
