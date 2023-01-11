import 'package:flutter/material.dart';
import 'package:flutter_training/Resuable-Widget/bottomnavbar.dart';
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          drawer: NavBar(),
          backgroundColor: Color.fromRGBO(51, 101, 200, 1),
          bottomNavigationBar: BottomNavBar(),
        ),
      )
    ]);
  }
}
