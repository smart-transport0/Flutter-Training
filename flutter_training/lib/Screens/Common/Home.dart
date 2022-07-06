import 'package:flutter/material.dart';
import 'package:flutter_training/Resuable-Widget/inputfield.dart';
import 'package:flutter_training/Screens/Common/Login.dart';
import 'package:flutter_training/Screens/Common/Register.dart';

class Home extends StatelessWidget {
  @override
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
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
                    Navigator.of(context).push(
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
}
