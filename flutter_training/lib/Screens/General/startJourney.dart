import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/Data-Services/addJourney.dart';
import 'package:flutter_training/Data-Services/utilities.dart';
import 'package:flutter_training/Resuable-Widget/bottomnavbar.dart';
import 'package:flutter_training/Resuable-Widget/navbar.dart';
import 'package:flutter_training/Screens/General/listedJourney.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Resuable-Widget/inputfield.dart';

class StartJourney extends StatefulWidget {
  @override
  State<StartJourney> createState() => _StartJourneyState();
}

class _StartJourneyState extends State<StartJourney> {
  var listedJourney = [];
  late SharedPreferences sharedPreferences;
  Utilities utilities = Utilities();
  void initState() {
    super.initState();
    initial();
    // newFeature();
  }

  Reusable reusable = Reusable();
  TextEditingController journeyDateController = TextEditingController();
  TextEditingController leaveTimeController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController availableSeatsController = TextEditingController();
  TextEditingController paidUnpaidController = TextEditingController();
  TextEditingController numberPlateController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController routeController = TextEditingController();
  //text editing controllers for input fields
  int view = 1;
  bool showJourney = true;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    String chosenValue;
    listedJourney = [];
    return Stack(
      children: [
        reusable.getBackgroundImage("startJourney.jpg"),
        Scaffold(
          appBar: AppBar(
            title: Text('Start Journey'),
            centerTitle: true,
          ),
          floatingActionButton: Visibility(
            visible: showJourney,
            child: new FloatingActionButton(
                elevation: 0.0,
                child: new Icon(Icons.add, color: Colors.red),
                backgroundColor: Colors.white70,
                onPressed: () {
                  setState(() {
                    showJourney = false;
                  });
                }),
          ),
          backgroundColor: Colors.transparent,
          drawer: NavBar(),
          bottomNavigationBar: BottomNavBar(),
          body: Padding(
            padding: EdgeInsets.all(50.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                  child: Column(
                children: <Widget>[
                  Visibility(
                    visible: showJourney,
                    child: FutureBuilder(
                        future: newFeature(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: listedJourney.length,
                              itemBuilder: (context, index) => Container(
                                child: Column(children: <Widget>[
                                  Container(
                                    width: w * 0.85,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        color: Colors.white70,
                                        child: ListTile(
                                          title: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, h * 0.03, 0.0, h * 0.03),
                                            child: Column(children: <Widget>[
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Text(
                                                        'Date ' +
                                                            '${listedJourney[index][0]}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: Colors.blue
                                                                .shade900)),
                                                    Container(
                                                        width: 25,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.red,
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          '10',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ))),
                                                  ]),
                                              SizedBox(height: h * 0.01),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text('Source Place'),
                                                    Text(
                                                      '${listedJourney[index][1]}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors
                                                              .blue.shade900),
                                                    ),
                                                    SizedBox(height: h * 0.01),
                                                    Text('Destination Place'),
                                                    Text(
                                                      '${listedJourney[index][2]}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors
                                                              .blue.shade900),
                                                    )
                                                  ])
                                            ]),
                                          ),
                                          onTap: () {
                                            String value =
                                                listedJourney[index][3];
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ListedJourney(value)));
                                          },
                                        )),
                                  )
                                ]),
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ),
                  Visibility(
                    visible: !showJourney,
                    child: Container(
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              w * 0.15, 0.01 * h, 0.0, 0.025 * h),
                          child: Text(
                            'START YOUR JOURNEY!',
                            style: TextStyle(
                              fontSize: w * 0.08,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'comic',
                              color: Colors.orange.shade900,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: const Offset(4.0, 3.0),
                                  blurRadius: 5.0,
                                  color: Colors.white70,
                                )
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                            visible: (view == 1),
                            child: Container(
                                child: Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.025 * h),
                                child: reusable.getDateInput(
                                    context,
                                    journeyDateController,
                                    'Journey Date',
                                    Colors.white38),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.025 * h),
                                child: reusable.getTimeInput(
                                    context,
                                    leaveTimeController,
                                    'Leave Time',
                                    Colors.white38),
                              ),
                              reusable.getInput(
                                  0,
                                  0,
                                  0,
                                  h * 0.025,
                                  Icons.home,
                                  'Source',
                                  Colors.white38,
                                  sourceController,
                                  TextInputType.text),
                              reusable.getInput(
                                  0,
                                  0,
                                  0,
                                  h * 0.025,
                                  Icons.local_parking,
                                  'Destination',
                                  Colors.white38,
                                  destinationController,
                                  TextInputType.text),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            view++;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(w * 0.01),
                                          child: Text(
                                            'Next',
                                            style:
                                                TextStyle(fontSize: w * 0.06),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blueAccent.shade200,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))))
                                  ])
                            ]))),
                        Visibility(
                            visible: (view == 2),
                            child: Container(
                                child: Column(children: <Widget>[
                              reusable.getInput(
                                  0,
                                  0,
                                  0,
                                  h * 0.025,
                                  Icons.time_to_leave,
                                  'Vehicle Type',
                                  Colors.white38,
                                  vehicleTypeController,
                                  TextInputType.text),
                              reusable.getInput(
                                  0,
                                  0,
                                  0,
                                  h * 0.025,
                                  Icons.people,
                                  'Available Seats',
                                  Colors.white38,
                                  availableSeatsController,
                                  TextInputType.number),
                              reusable.getInput(
                                  0,
                                  0,
                                  0,
                                  h * 0.025,
                                  Icons.numbers,
                                  'Number Plate',
                                  Colors.white38,
                                  numberPlateController,
                                  TextInputType.text),
                              reusable.getInput(
                                  0,
                                  0,
                                  0,
                                  h * 0.025,
                                  Icons.route,
                                  'Route',
                                  Colors.white38,
                                  routeController,
                                  TextInputType.text),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            view--;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(w * 0.01),
                                          child: Text(
                                            'Back',
                                            style:
                                                TextStyle(fontSize: w * 0.06),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blueAccent.shade200,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)))),
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            view++;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(w * 0.01),
                                          child: Text(
                                            'Next',
                                            style:
                                                TextStyle(fontSize: w * 0.06),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blueAccent.shade200,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))))
                                  ])
                            ]))),
                        Visibility(
                            visible: (view == 3),
                            child: Container(
                                child: Column(children: <Widget>[
                              reusable.getInput(
                                  0,
                                  0,
                                  0,
                                  h * 0.025,
                                  Icons.paid,
                                  'Paid/Unpaid',
                                  Colors.white38,
                                  paidUnpaidController,
                                  TextInputType.text),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            view--;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(w * 0.01),
                                          child: Text(
                                            'Back',
                                            style:
                                                TextStyle(fontSize: w * 0.06),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blueAccent.shade200,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))))
                                  ]),
                              ElevatedButton(
                                  onPressed: () async {
                                    String userID = sharedPreferences
                                        .getString('phoneNumber')
                                        .toString();
                                    AddJourney newJourney = AddJourney();
                                    bool status = await newJourney.addJourney(
                                        userID,
                                        journeyDateController.text,
                                        leaveTimeController.text,
                                        sourceController.text,
                                        destinationController.text,
                                        vehicleTypeController.text,
                                        availableSeatsController.text,
                                        numberPlateController.text,
                                        routeController.text,
                                        paidUnpaidController.text);
                                    if (status) {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                          'Added Successfully')),
                                                  content: Text(
                                                      'Your Journey from ${sourceController.text} to ${destinationController.text} was listed successfully'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            showJourney = true;
                                                          });
                                                        },
                                                        child: Text('ok')),
                                                  ]));
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                          'Oops! Some error occurred...')),
                                                  content: Text(
                                                      'Due to some error, your journey was not listed. Please try again.'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            Text('Try Again')),
                                                  ]));
                                    }
                                    newFeature();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(w * 0.01),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(fontSize: w * 0.06),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green.shade700,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))))
                            ])))
                      ]),
                    ),
                  )
                ],
              )),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<List> newFeature() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String userID = sharedPreferences.getString('phoneNumber').toString();
    var result =
        await FirebaseFirestore.instance.collection('TransporterList').get();
    result.docs.forEach((res) {
      String temp = res.id.substring(0, 10);
      if (temp == utilities.remove91(userID)) {
        listedJourney.add([
          res['JourneyDate'],
          res['SourcePlace'],
          res['DestinationPlace'],
          res.id
        ]);
      }
    });
    if (listedJourney.length == 0) {
      setState(() {
        showJourney = false;
      });
    }
    return listedJourney;
  }
}
