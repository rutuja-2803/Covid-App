import 'package:cricket/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:cricket/widgets/ourContainer.dart';
import 'package:provider/provider.dart';
import 'package:cricket/widgets/image_input.dart';
import 'dart:io';

class OurSignUpForm extends StatefulWidget {
  @override
  _OurSignUpFormState createState() => _OurSignUpFormState();
}

class _OurSignUpFormState extends State<OurSignUpForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cofirmPasswordController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  File _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _signUpUser(String email, String password, BuildContext context,
      String fullName) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString =
          await _currentUser.signUpUser(email, password, fullName);
      if (_returnString == "success") {
        Navigator.pop(context);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Incorrect Login Info"),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.cyan,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _fullNameController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline), hintText: "Full Name"),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _cofirmPasswordController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_open), hintText: "Confirm Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        // TextFormField(
        //   controller: _titleController,
        //   decoration: InputDecoration(
        //       prefixIcon: Icon(Icons.image), labelText: "Take A selfie"),
        //   obscureText: true,
        // ),
        SizedBox(height: 20.0),
        ImageInput(_selectImage),
        Row(),
        RaisedButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                "Confirm Image",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            onPressed: () {}
            // CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

            // ImageInputState ok = Provider.of<ImageInputState>(context, listen: false);
            //   ImageInputState().uploadImageToFirebase(context)

            ),
        RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.0),
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          onPressed: () {
            if (_passwordController.text == _cofirmPasswordController.text) {
              _signUpUser(_emailController.text, _passwordController.text,
                  context, _fullNameController.text);
            } else {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("passwords do not match"),
                duration: Duration(seconds: 2),
              ));
            }
          },
        ),
      ],
    ));
  }
}
