import 'package:flutter/material.dart';
import 'package:flutter_training/Screens/General/startJourney.dart';
import 'package:flutter_training/Screens/General/welcome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => StartJourney()));
      } else if (selectedIndex == 2) {
        Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => Welcome()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color.fromRGBO(0, 56, 68, 1),
      backgroundColor: Color.fromRGBO(255, 177, 0, 1.0),
      iconSize: 25.0,
      items: const [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.locationDot), label: "Create"),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userPlus), label: "Join"),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house), label: "Home"),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlassLocation),
            label: "Search"),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidCommentDots), label: "Chat"),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      onTap: onItemTapped,
    );
  }
}
