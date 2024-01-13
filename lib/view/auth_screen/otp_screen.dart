import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../controller/services/auth_services/auth_services.dart';
import 'auth_screen.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.mobileNumber});
  String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        shadowColor: grey,
        elevation: 3,
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage('assets/images/amazon_logo.png'),
          height: height * 0.04,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Authentication Required',
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: widget.mobileNumber,
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' Change', style: textTheme.bodySmall),
                  ],
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              Text(
                'We have send a One Time Password (OTP) to the mobile no. above. Please enter it to complete Verification.',
                style: textTheme.labelLarge,
              ),
              CommonFunctions.blankSpace(height * 0.02, width),
              SizedBox(
                height: height * 0.08,
                child: TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    hintStyle: textTheme.bodySmall,
                  ),
                ),
              ),
              CommonAuthButton(
                buttonwidth: 0.99,
                title: 'Continue',
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const HomeScreen(),
                  //     ));
                  AuthServices.verifyOTP(
                    context: context,
                    otp: otpController.text.trim(),
                  );
                },
              ),
              CommonFunctions.blankSpace(height * 0.002, width),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend OTP',
                      style: textTheme.bodySmall!.copyWith(color: blue),
                    )),
              ]),
              CommonFunctions.blankSpace(height * 0.01, width),
              const BottomAuthWidget(),
            ],
          ),
        )),
      ),
    );
  }
}
