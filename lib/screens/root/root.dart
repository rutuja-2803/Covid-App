import 'package:cricket/screens/home/home.dart';
import 'package:cricket/screens/login/login.dart';
// import 'package:cricket/splashScreen/splashScreen.dart';
import 'package:cricket/states/currentUser.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  // unknown,
  notLoggedIn,
  loggedIn
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartUp();

    if (_returnString == "success") {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      // case AuthStatus.unknown:
      //   retVal = SplashScreen();
      //   break;
      case AuthStatus.notLoggedIn:
        retVal = OurLogin();
        break;
      case AuthStatus.loggedIn:
        retVal = HomeScreen();

        break;
      default:
    }

    return retVal;
  }
}
