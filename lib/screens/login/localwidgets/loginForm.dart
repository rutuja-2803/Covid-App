import 'package:cricket/screens/root/root.dart';
import 'package:cricket/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:cricket/widgets/ourContainer.dart';
import 'package:cricket/states/currentUser.dart';
import 'package:provider/provider.dart';

enum LoginType {
  email,
  google,
}

class OurLoginForm extends StatefulWidget {
  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailcontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _passwordcontroller = TextEditingController();
  

  void _loginUser(
      {@required LoginType type,
      String email,
      String password,
      BuildContext context}) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString;
      switch (type) {
        case LoginType.email:
          _returnString =
              await _currentUser.loginUserWithEmail(email, password);
          break;
        case LoginType.google:
          _returnString = await _currentUser.loginUserWithGoogle();
          break;
        default:
      }
      if (_returnString == "success") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => OurRoot(),
          ),
          (route) => false,
        );
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_returnString),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _googleButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        _loginUser(
          type: LoginType.google,
          context: context,
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/google2.png"),
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Sign in with Google",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "Log In",
            style: TextStyle(
                color: Colors.cyan,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _emailcontroller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _passwordcontroller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
          obscureText: true,
        ),
        SizedBox(height: 20.0), //sized box
        RaisedButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            onPressed: () {
              _loginUser(
                  type: LoginType.email,
                  email: _emailcontroller.text,
                  password: _passwordcontroller.text,
                  context: context);
            }),
        FlatButton(
          child: Text("Don't have an account? Sign up here"),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OurSignUp(),
              ),
            );
          },
        ),
        _googleButton(),
      ],
    ));
  }
}
