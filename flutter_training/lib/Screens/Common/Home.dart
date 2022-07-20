import 'package:flutter/material.dart';
import 'package:flutter_training/Resuable-Widget/inputfield.dart';
import 'package:flutter_training/Screens/Common/Login.dart';
import 'package:flutter_training/Screens/Common/Register.dart';
import 'package:flutter_training/Screens/General/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    check_if_already_logged_in();
  }

  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Reusable reusable = Reusable();

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          reusable.getBackgroundImage('home.jpg'),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: h * 0.11,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(4.0, 3.0),
                          blurRadius: 5.0,
                          color: Colors.brown.shade600,
                        )
                      ],
                      fontFamily: 'comic',
                      fontSize: w * 0.15,
                      color: const Color.fromARGB(185, 0, 0, 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.075,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          color: Colors.brown.shade600,
                        )
                      ],
                      fontFamily: 'comic',
                      fontSize: w * 0.15,
                      color: const Color.fromARGB(185, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void check_if_already_logged_in() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? newUser = sharedPreferences.getString('phoneNumber');
    if (newUser != null) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Welcome()));
    }
  }
}
