import 'dart:math' as prefix;
import 'dart:developer';
import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AuthServices {
  static receiveOTP(
      {required BuildContext context, required String mobileNo}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      auth.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {
            log(credential.toString());
          },
          verificationFailed: (FirebaseAuthException exception) {
            log(exception.toString());
          },
          codeSent: (String verificationID, int? resendToken) {
            Navigator.push(
                context,
                PageTransition(
                    child: OTPScreen(mobileNumber: mobileNo),
                    type: PageTransitionType.rightToLeft));
          },
          codeAutoRetrievalTimeout: (String verificationID) {});
    } catch (e) {
      log(e.toString());
    }
  }
}
