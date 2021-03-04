import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String uid;
  String email;
  String groupId;
  String fullName;
  Timestamp accountCreated;

  OurUser({
    this.uid,
    this.email,
    this.groupId,
    this.accountCreated,
    this.fullName,
  });
}
