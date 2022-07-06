import 'package:flutter/material.dart';

class Reusable {
  Padding getInput(double left, double top, double right, double bottom,
      IconData icon, String hinttext, Color color, TextEditingController xyz, TextInputType textInputType) {
    return Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: TextField(
            controller: xyz,
            keyboardType: textInputType,
            decoration: InputDecoration(
                prefixIcon: Icon(icon),
                hintText: hinttext,
                filled: true,
                fillColor: color,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)))));
  }

  Container getBackgroundImage(String path) {
    String imagePath = "assets/images/" + path;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(imagePath))));
  }
}
