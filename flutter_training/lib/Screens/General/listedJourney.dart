import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/Data-Services/utilities.dart';
import 'package:flutter_training/Resuable-Widget/bottomnavbar.dart';
import 'package:flutter_training/Resuable-Widget/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListedJourney extends StatefulWidget {
  String travelID = '';
  ListedJourney(String travelID) {
    this.travelID = travelID;
    print(travelID);  
  }
  @override
  State<ListedJourney> createState() => _ListedJourneyState();
}

class _ListedJourneyState extends State<ListedJourney> {
  @override
  List journeyInfo = [];
  Widget build(BuildContext context) {
    String travelID = widget.travelID;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Journey Details  '), centerTitle: true),
      drawer: NavBar(),
      body: Column(children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
              color: Colors.amber,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: h * 0.015, horizontal: w * 0.04),
                child: Row(children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: Container(
                        // color: Colors.blueGrey,
                        child: FutureBuilder(
                            future: journeyData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, h * 0.01),
                                        child: Text(
                                            'Journey Date - ${journeyInfo[0]}',
                                            style:
                                                TextStyle(fontSize: h * 0.025)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, h * 0.01),
                                        child: Text(
                                            'Leave Time - ${journeyInfo[1]}',
                                            style:
                                                TextStyle(fontSize: h * 0.025)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, h * 0.01),
                                        child: Text(
                                            'Source - ${journeyInfo[2]}',
                                            style:
                                                TextStyle(fontSize: h * 0.025)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, h * 0.01),
                                        child: Text(
                                            'Destination - ${journeyInfo[3]}',
                                            style:
                                                TextStyle(fontSize: h * 0.025)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, h * 0.01),
                                        child: Text(
                                            'Vehicle Type - ${journeyInfo[4]}',
                                            style:
                                                TextStyle(fontSize: h * 0.025)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, h * 0.01),
                                        child: Text(
                                            'Available Seats - ${journeyInfo[5]}',
                                            style:
                                                TextStyle(fontSize: h * 0.025)),
                                      ),
                                      Text('Number Plate - ${journeyInfo[6]}',
                                          style:
                                              TextStyle(fontSize: h * 0.025)),
                                    ]);
                              } else
                                return CircularProgressIndicator();
                            }),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.greenAccent,
                        child: Column(children: <Widget>[
                          IconButton(
                              onPressed: () {}, icon: FaIcon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: FaIcon(Icons.delete)),
                          IconButton(
                              onPressed: () {},
                              icon: FaIcon(Icons.notifications_off)),
                          IconButton(
                              onPressed: () {}, icon: FaIcon(Icons.chat)),
                          IconButton(
                              onPressed: () {}, icon: FaIcon(Icons.check_box))
                        ]),
                      ))
                ]),
              )),
        ),
        Expanded(
            flex: 1,
            child: Container(
                color: Colors.blue,
                width: double.infinity,
                child:
                    SingleChildScrollView(child: Column(children: <Widget>[]))))
      ]),
      bottomNavigationBar: BottomNavBar(),
    ));
  }

  Future<List> journeyData() async {
    var databaseData = await FirebaseFirestore.instance
        .collection('TransporterList')
        .doc(widget.travelID)
        .get();
    journeyInfo.add(databaseData['JourneyDate']);
    journeyInfo.add(databaseData['LeaveTime']);
    journeyInfo.add(databaseData['SourcePlace']);
    journeyInfo.add(databaseData['DestinationPlace']);
    journeyInfo.add(databaseData['VehicleType']);
    journeyInfo.add(databaseData['AvailableSeats']);
    journeyInfo.add(databaseData['NumberPlate']);
    return journeyInfo;
  }
}
