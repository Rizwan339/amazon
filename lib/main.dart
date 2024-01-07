import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      // home: AuthScreen(),
      home: OTPScreen(
        mobileNumber: '+92 3059691378',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
