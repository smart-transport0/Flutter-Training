import 'package:flutter/material.dart';
import 'package:flutter_training/Data-Services/users.dart';
import 'package:flutter_training/Resuable-Widget/inputfield.dart';
import 'package:flutter_training/Screens/General/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../General/registerGeneral.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    initial();
  }

  Reusable reusable = Reusable();
  Users user = Users();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      reusable.getBackgroundImage('login.jpg'),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.37, h * 0.143, 0.0, 0.0),
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: h * 0.1,
                          color: Colors.white,
                          fontFamily: 'comic'))),
              SingleChildScrollView(
                  child: Container(
                      child: Column(children: <Widget>[
                SizedBox(height: h * 0.4),
                reusable.getInput(
                    w * 0.1,
                    0.0,
                    w * 0.1,
                    0.0,
                    Icons.phone,
                    'Mobile Number',
                    Colors.blue.shade50,
                    mobileNumberController,
                    TextInputType.phone),
                SizedBox(height: h * 0.01),
                reusable.getInput(
                    w * 0.1,
                    0.0,
                    w * 0.1,
                    0.0,
                    Icons.lock_rounded,
                    'Password',
                    Colors.blue.shade50,
                    passwordController,
                    TextInputType.text),
                SizedBox(height: h * 0.01),
                ElevatedButton(
                    onPressed: () async {
                      int decider = await user.signIn(
                          mobileNumberController.text, passwordController.text);
                      if (decider == 1) {
                        sharedPreferences.setString('phoneNumber',
                            mobileNumberController.text.toString());

                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Welcome()));
                      } else if (decider == 2) {
                      } else if (decider == 3) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => registerGeneral()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            w * 0.05, h * 0.005, w * 0.05, h * 0.005),
                        child: Text('Login',
                            style: TextStyle(
                                fontFamily: 'comic',
                                fontSize: w * 0.08,
                                color: const Color.fromARGB(185, 0, 0, 0))))),
                SizedBox(height: h * 0.05),
              ])))
            ],
          )))
    ]);
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
