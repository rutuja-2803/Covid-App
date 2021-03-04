import 'package:cricket/models/user.dart';
import 'package:cricket/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser extends ChangeNotifier {
  OurUser currentUser = OurUser();

  OurUser get getCurrentUser => currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = "error";

    try {
      // ignore: await_only_futures
      User _firebaseUser = await auth.currentUser;
      if (_firebaseUser != null) {
        currentUser = await OurDatabase().getUserInfo(_firebaseUser.uid);
        print(currentUser.fullName);
        if (currentUser != null) {
          retVal = "success";
        }
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> signOut() async {
    String retVal = "error";
    try {
      await auth.signOut();
      currentUser = OurUser();
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String retVal = "error";
    OurUser _user = OurUser();
    try {
      UserCredential _authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _user.uid = _authResult.user.uid;
      _user.email = _authResult.user.email;
      _user.fullName = fullName;
      OurDatabase().createUser(_user);
      String _returnString = await OurDatabase().createUser(_user);
      if (_returnString == "success") {
        retVal = "success";
      }
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "error";

    try {
      UserCredential _authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      currentUser = await OurDatabase().getUserInfo(_authResult.user.uid);
      if (currentUser != null) {
        retVal = "success";
      }
    } catch (e) {
      retVal = e.message;
    }

    return retVal;
  }

  Future<String> loginUserWithGoogle() async {
    String retVal = "error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    OurUser _user = OurUser();

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      // ignore: deprecated_member_use
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      UserCredential _authResult = await auth.signInWithCredential(credential);

      if (_authResult.additionalUserInfo.isNewUser) {
        _user.uid = _authResult.user.uid;
        _user.email = _authResult.user.email;
        _user.fullName = _authResult.user.displayName;

        OurDatabase().createUser(_user);
      }

      await OurDatabase().getUserInfo(_authResult.user.uid);
      if (currentUser != null) {
        retVal = "success";
      }
    } catch (e) {
      retVal = e.message;
    }

    return retVal;
  }
}
