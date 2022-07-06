import 'package:flutter/material.dart';
import 'package:flutter_training/Resuable-Widget/inputfield.dart';
import 'package:flutter_training/Screens/General/registerGeneral.dart';
import 'package:flutter_training/Screens/Organization/registerorganization.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Reusable reusable = Reusable();

    return Stack(children: <Widget>[
      reusable.getBackgroundImage('entry_register.jpg'),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(w * 0.234, h * 0.10, 0.0, 0.0),
                  child: Text('Register',
                      style: TextStyle(
                          fontSize: h * 0.09,
                          color: Colors.white,
                          fontFamily: 'comic'))),
              Container(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, h * 0.5, 0.0, 0.0),
                child: Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, h * 0.10, 0.0, 0.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => registerOrganization()));
                        },
                        child: Text('Organization',
                            style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                      offset: const Offset(3.0, 3.0),
                                      blurRadius: 5.0,
                                      color: Colors.brown.shade600)
                                ],
                                fontFamily: 'comic',
                                fontSize: w * 0.085,
                                color: Colors.amber[50]))),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(w * 0.17, 0.0, 0.0, h * 0.09),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => registerGeneral()));
                        },
                        child: Text('General',
                            style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                      offset: const Offset(2.0, 2.0),
                                      blurRadius: 5.0,
                                      color: Colors.pink.shade100)
                                ],
                                fontFamily: 'comic',
                                fontSize: w * 0.085,
                                color: Colors.pink))),
                  ),
                ]),
              )),
            ],
          )))
    ]);
  }
}
