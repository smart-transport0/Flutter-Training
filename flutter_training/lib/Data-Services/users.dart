import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart';

class Users {
  Future<void> createUser(
      String mobileNumber,
      String password,
      String firstName,
      String middleName,
      String lastName,
      String DateOfBirth,
      String emergencyContactNo) async {
    await FirebaseFirestore.instance
        .collection('UserInformation')
        .doc(mobileNumber)
        .set({
      'UserID': mobileNumber,
      'Password': encrypt(password),
      'FirstName': firstName,
      'MiddleName': middleName,
      'LastName': lastName,
      'DateOfBirth': DateOfBirth,
      'EmergencyContactNo': emergencyContactNo,
      'TotalJourneyListed': 0,
    });
    return;
  }

  Future<int> signIn(String mobileNumber, String password) async {
    //decider 1 then userid and password is matched then allow to login
    //decider 2 then userid exists but password is incorrect
    //decidor 3 then user does not exist
    int decider = 0;

    var user = await FirebaseFirestore.instance
        .collection('UserInformation')
        .doc(mobileNumber)
        .get();
    if (user.exists) {
      var variablePassword = "";
      variablePassword = decrypt(user.get('Password').toString());
      if (variablePassword.compareTo(password) == 0) {
        return 1;
      } else {
        return 2;
      }
    }
    return 3;
  }

  static encrypt(String passsword) {
    final key = Key.fromUtf8('[!(%%FQ6cd7[FZZ0');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return encrypter.encrypt(passsword, iv: iv).base64;
  }

  static decrypt(String passsword) {
    final key = Key.fromUtf8('[!(%%FQ6cd7[FZZ0');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return encrypter.decrypt64(passsword, iv: iv);
  }
}
