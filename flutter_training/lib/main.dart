import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/Resuable-Widget/navbar.dart';
import 'package:flutter_training/Screens/Common/Home.dart';
import 'package:flutter_training/Screens/General/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(home: Welcome()));
}
