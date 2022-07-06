import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/Data-Services/users.dart';
import 'package:flutter_training/Resuable-Widget/inputfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_training/Screens/Common/Login.dart';

class registerGeneral extends StatefulWidget {
  @override
  State<registerGeneral> createState() => _registerGeneralState();
}

class _registerGeneralState extends State<registerGeneral> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIdReceived = '';
  bool setVisiblity = false;

  Reusable reusable = Reusable();

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emergencyContactNumberController =
      TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      reusable.getBackgroundImage('register.jpg'),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.2, h * 0.035, 0.0, 0.0),
                  child: Text('Register',
                      style: TextStyle(
                          fontSize: h * 0.1,
                          color: Colors.white,
                          fontFamily: 'comic'))),
              SingleChildScrollView(
                  child: Container(
                      child: Column(children: <Widget>[
                SizedBox(height: h * 0.2),
                Visibility(
                  visible: !setVisiblity,
                  child: Container(
                    child: Column(
                      children: [
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
                        reusable.getInput(
                            w * 0.1,
                            0.0,
                            w * 0.1,
                            0.0,
                            Icons.person,
                            'Full Name',
                            Colors.blue.shade50,
                            fullNameController,
                            TextInputType.name),
                        SizedBox(height: h * 0.01),
                        reusable.getInput(
                            w * 0.1,
                            0.0,
                            w * 0.1,
                            0.0,
                            Icons.cake,
                            'Date Of Birth',
                            Colors.blue.shade50,
                            dateOfBirthController,
                            TextInputType.datetime),
                        SizedBox(height: h * 0.01),
                        reusable.getInput(
                            w * 0.1,
                            0.0,
                            w * 0.1,
                            0.0,
                            Icons.phone,
                            'Emergency Contact Number',
                            Colors.blue.shade50,
                            emergencyContactNumberController,
                            TextInputType.phone),
                        SizedBox(height: h * 0.01),
                        ElevatedButton(
                            onPressed: () {
                              verifyNumber();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent.shade200,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    w * 0.05, h * 0.005, w * 0.05, h * 0.005),
                                child: Text('Send OTP',
                                    style: TextStyle(
                                        fontFamily: 'comic',
                                        fontSize: w * 0.08,
                                        color: const Color.fromARGB(
                                            185, 0, 0, 0))))),
                        SizedBox(height: h * 0.05),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: setVisiblity,
                  child: Container(
                    child: Column(
                      children: [
                        reusable.getInput(
                            w * 0.1,
                            0.0,
                            w * 0.1,
                            0.0,
                            Icons.lock_rounded,
                            'OTP',
                            Colors.blue.shade50,
                            otpController,
                            TextInputType.number),
                        SizedBox(height: h * 0.01),
                        ElevatedButton(
                            onPressed: () {
                              verifyCode();
                              Users user = Users();
                              user.createUser(
                                  mobileNumberController.text,
                                  passwordController.text,
                                  fullNameController.text,
                                  dateOfBirthController.text,
                                  emergencyContactNumberController.text);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent.shade200,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    w * 0.05, h * 0.005, w * 0.05, h * 0.005),
                                child: Text('Verify ',
                                    style: TextStyle(
                                        fontFamily: 'comic',
                                        fontSize: w * 0.08,
                                        color: const Color.fromARGB(
                                            185, 0, 0, 0))))),
                        SizedBox(height: h * 0.05),
                      ],
                    ),
                  ),
                ),
              ])))
            ],
          )))
    ]);
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: mobileNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException exception) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => registerGeneral()));
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIdReceived = verificationID;
          setVisiblity = true;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdReceived, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Login()))
        });
  }
}
