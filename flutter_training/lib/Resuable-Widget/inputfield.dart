import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Reusable {
  Padding getInput(
      double left,
      double top,
      double right,
      double bottom,
      IconData icon,
      String hinttext,
      Color color,
      TextEditingController xyz,
      TextInputType textInputType) {
    return Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: TextField(
            controller: xyz,
            keyboardType: textInputType,
            decoration: InputDecoration(
                prefixIcon: Icon(icon),
                labelText: hinttext,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                hintText: hinttext,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: color,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(30)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2.0),
                    borderRadius: BorderRadius.circular(30)))));
  }

  Container getBackgroundImage(String path) {
    String imagePath = "assets/images/" + path;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(imagePath))));
  }

  TextField getDateInput(var thisContext, TextEditingController dateinput,
      String label, Color bgColor) {
    return TextField(
      controller: dateinput, //editing controller of this TextField
      decoration: InputDecoration(
          fillColor: bgColor,
          prefixIcon: Icon(Icons.date_range),
          labelText: label,
          hintText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber, width: 2.0),
              borderRadius: BorderRadius.circular(30))),
      readOnly: true, //set it true, so that user will not able to edit text

      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: thisContext, initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(
              days: 0)), //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime(2101),
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement
          dateinput.text = formattedDate;
          // setState(() {
          //    //set output date to TextField value.
          // });
        }
      },
    );
  }

  TextField getPastDateInput(var thisContext, TextEditingController dateinput,
      String label, Color bgColor) {
    return TextField(
      controller: dateinput, //editing controller of this TextField
      decoration: InputDecoration(
          fillColor: bgColor,
          prefixIcon: Icon(Icons.date_range),
          labelText: label,
          hintText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber, width: 2.0),
              borderRadius: BorderRadius.circular(30))),
      readOnly: true, //set it true, so that user will not able to edit text

      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: thisContext, initialDate: DateTime(DateTime.now().year - 17),
          firstDate: DateTime(
              1800), //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime(DateTime.now().year - 17),
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement
          dateinput.text = formattedDate;
          // setState(() {
          //    //set output date to TextField value.
          // });
        }
      },
    );
  }

  TextFormField getTimeInput(var thisContext,
      TextEditingController timeController, String hinttext, Color bgColor) {
    return TextFormField(
      controller: timeController,
      readOnly: true,
      decoration: InputDecoration(
          fillColor: bgColor,
          labelText: hinttext,
          prefixIcon: Icon(Icons.alarm),
          //hintText: hinttext,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber, width: 2.0),
              borderRadius: BorderRadius.circular(30))),
      onTap: () async {
        TimeOfDay time = TimeOfDay.now();
        FocusScope.of(thisContext).requestFocus(new FocusNode());

        TimeOfDay? picked =
            await showTimePicker(context: thisContext, initialTime: time);
        if (picked != null && picked != time) {
          timeController.text = picked.toString(); // add this line.
          timeController.text = picked.format(thisContext);
          time = picked;
          // setState(() {
          //   time = picked;
          // });
        }
      },
      validator: (value) {
        if (value!.isEmpty) return 'Cant be empty';
        return null;
      },
    );
  }
}
