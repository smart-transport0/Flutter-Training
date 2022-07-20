import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late SharedPreferences sharedPreferences;
  void initState() {
    super.initState();
    initial();
  }

  String fullName = "",
      phoneNumber = "",
      dateOfBirth = "",
      emergencyContactNumber = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 53, 76),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Profile'),
      ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NAME',
                    style: TextStyle(color: Colors.white, letterSpacing: 2.0),
                  ),
                  Text(
                    fullName,
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PHONE NUMBER',
                    style: TextStyle(color: Colors.white, letterSpacing: 2.0),
                  ),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DATE OF BIRTH',
                    style: TextStyle(color: Colors.white, letterSpacing: 2.0),
                  ),
                  Text(
                    dateOfBirth,
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EMERGENCY CONTACT NUMBER',
                    style: TextStyle(color: Colors.white, letterSpacing: 2.0),
                  ),
                  Text(
                    emergencyContactNumber,
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ])),
    ));
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    phoneNumber = sharedPreferences.getString('phoneNumber').toString();
    retriveData();
  }

  Future<void> retriveData() async {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection('UserInformation')
        .doc(phoneNumber)
        .get();
    var data = documentSnapshot.data();

    setState(() {
      fullName = data!['FirstName'] +
          " " +
          data['MiddleName'] +
          " " +
          data['LastName'];
      dateOfBirth = data['DateOfBirth'];
      emergencyContactNumber = data['EmergencyContactNo'];
    });
  }
}
