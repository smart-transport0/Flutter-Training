import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/Screens/Common/Home.dart';
import 'package:flutter_training/Screens/General/profile.dart';
import 'package:flutter_training/Screens/General/startJourney.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late SharedPreferences sharedPreferences;
  String phoneNumber = "";
  String fullName = "";
  void initState() {
    super.initState();
    initial();
  }

  Widget popup(BuildContext context) {
    return AlertDialog(
        title: Text('Logout'),
        content: Text('Do you really want to logout?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')),
          TextButton(
              onPressed: () {
                sharedPreferences.remove('phoneNumber');
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Confirm'))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: ListView(
        children: [
          FutureBuilder(builder: (context, snapshot) {
            return UserAccountsDrawerHeader(
              accountName: Text(fullName),
              accountEmail: Text(phoneNumber),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(66, 103, 178, 1.0),
              ),
            );
          }),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.userLarge),
            title: Text('Profile'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Profile())),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.mapLocationDot),
            title: Text('Start Journey'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => StartJourney())),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.userPlus),
            title: Text('Join  Journey'),
            onTap: () => null,
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.solidCommentDots),
            title: Text('Chat'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.clockRotateLeft),
            title: Text('Journey History'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.circleInfo),
            title: Text('About Us'),
          ),
          ListTile(
              leading: FaIcon(FontAwesomeIcons.arrowRightFromBracket),
              title: Text('Logout'),
              onTap: () {
                showDialog(
                    context: context, builder: (context) => popup(context));
              }),
        ],
      ),
    );
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    phoneNumber = sharedPreferences.getString('phoneNumber').toString();
    var documentSnapshot = await FirebaseFirestore.instance
        .collection('UserInformation')
        .doc(phoneNumber)
        .get();
    var data = documentSnapshot.data();
    fullName =
        data!['FirstName'] + " " + data['MiddleName'] + " " + data['LastName'];
  }
}
