import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_training/Data-Services/utilities.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddJourney {
  var currentDateTime = DateTime.now();

  Future<bool> addJourney(
      String userID,
      String journeyDate,
      String leaveTime,
      String source,
      String destination,
      String vehicleType,
      String availableSeats,
      String numberPlate,
      String route,
      String paidUnpaid) async {
    Utilities utilities = new Utilities();
    String travelID = utilities.remove91(userID) + utilities.currentDateTime();
    await FirebaseFirestore.instance
        .collection('TransporterList')
        .doc(travelID)
        .set({
      'TravelID': travelID,
      'TransporterID': userID,
      'JourneyDate': journeyDate,
      'LeaveTime': leaveTime,
      'SourcePlace': source,
      'DestinationPlace': destination,
      'VehicleType': vehicleType,
      'AvailableSeats': availableSeats,
      'PaidUnpaid': paidUnpaid,
      'NumberPlate': numberPlate,
      'MobileNumber': userID,
      'Route': route
    });
    var userData = await FirebaseFirestore.instance
        .collection('UserInformation')
        .doc(userID)
        .get();
    int totalJourneyListed = await userData['TotalJourneyListed'];
    await FirebaseFirestore.instance
        .collection('UserInformation')
        .doc(userID)
        .update({'TotalJourneyListed': totalJourneyListed + 1});
    var collectionRef =
        FirebaseFirestore.instance.collection('TransporterList');

    var doc = await collectionRef.doc(travelID).get();
    if (doc.exists) {
      await FirebaseFirestore.instance.collection('DataLog').doc(travelID).set({
        'TransporterID': userID,
        'NoPassenger': 0,
        'JourneyDate': journeyDate,
        'SourcePlace': source,
        'DestinationPlace': destination,
        'AvailableSeats': availableSeats,
        'NumberPlate': numberPlate,
        'Complete': false,
        'Problems': ''
      });
    }
    return doc.exists;
  }
}
