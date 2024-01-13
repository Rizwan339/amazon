import 'package:flutter/material.dart';

class AuthProviders extends ChangeNotifier {
  String phoneNumber = '';
  String verificationId = '';
  String otp = '';

  updatePhoneNum({required String num}) {
    phoneNumber = num;
    notifyListeners();
  }

  updateverificationId({required String verID}) {
    verificationId = verID;
    notifyListeners();
  }
}
