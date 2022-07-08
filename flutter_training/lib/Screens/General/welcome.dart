import 'package:flutter/material.dart';
import 'package:flutter_training/Resuable-Widget/inputfield.dart';
import 'package:flutter_training/Resuable-Widget/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Reusable reusable = Reusable();
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      reusable.getBackgroundImage('welcome.jpg'),
      SafeArea(
        child: Scaffold(
          drawer: NavBar(),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.white,
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
                  icon: FaIcon(FontAwesomeIcons.solidCommentDots),
                  label: "Chat"),
            ],
          ),
        ),
      )
    ]);
  }
}
