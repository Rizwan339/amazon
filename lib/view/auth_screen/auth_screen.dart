import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'otp_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool newUser = true;
  String currentCountryCode = '+92';
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: textTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                CommonFunctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                // SignIn(width, height, textTheme, context),
                // CreateAccount(width, height, textTheme, context),

                Builder(builder: (context) {
                  if (newUser) {
                    return signIn(width, height, textTheme, context);
                  }
                  return createAccount(width, height, textTheme, context);
                }),
                CommonFunctions.blankSpace(
                  height * 0.06,
                  0,
                ),
                const BottomAuthWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container signIn(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: greyShade3,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: greyShade3),
              ),
              color: greyShade1,
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      newUser = false;
                    });
                  },
                  child: Container(
                    height: height * 0.04,
                    width: width * 0.04,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white),
                    // alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: newUser ? transparent : secondaryColor,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(
                  0,
                  width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Create Account. ',
                          style: textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'New to Amazon? ', style: textTheme.bodySmall)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          newUser = true;
                        });
                      },
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.04,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: grey),
                            color: white),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: newUser ? secondaryColor : transparent,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(
                      0,
                      width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Sign in. ',
                              style: textTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Already a Customer',
                              style: textTheme.bodySmall)
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(
                  height * 0.01,
                  0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (val) {
                              setState(() {
                                currentCountryCode = '+${val.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.17,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: grey,
                          ),
                          color: greyShade2,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Text(
                          currentCountryCode,
                          //  style: TextStyle(fontSize: 18),
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.68,
                      child: TextFormField(
                        controller: mobileController,
                        cursorColor: black,
                        style: textTheme.bodyLarge!.copyWith(height: 1.2),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: textTheme.labelLarge),
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                CommonAuthButton(
                  buttonwidth: 0.85,
                  title: 'Continue',
                  onPressed: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => HomeScreen()));
                    AuthServices.receiveOTP(
                        context: context,
                        mobileNo:
                            '$currentCountryCode${mobileController.text.trim()}');
                  },
                ),
                CommonFunctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing you agree to Amazon\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Conditions of use ',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Privacy Notice',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container createAccount(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: greyShade3,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          newUser = false;
                        });
                      },
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.04,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: grey),
                            color: white),
                        // alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: newUser ? transparent : secondaryColor,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(
                      0,
                      width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Create Account. ',
                              style: textTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'New to Amazon?',
                              style: textTheme.bodySmall)
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(
                  height * 0.01,
                  0,
                ),
                SizedBox(
                  height: height * 0.06,
                  child: TextField(
                    controller: nameController,
                    cursorHeight: 25,
                    cursorColor: black,
                    style: textTheme.bodyLarge!.copyWith(height: 1.5),
                    decoration: InputDecoration(
                      hintText: 'First and Last Name',
                      hintStyle: textTheme.labelLarge,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(
                  height * 0.01,
                  0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (val) {
                              setState(() {
                                currentCountryCode = '+${val.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.17,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: grey,
                          ),
                          color: greyShade2,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.68,
                      child: TextFormField(
                        cursorHeight: 25,
                        controller: mobileController,
                        cursorColor: black,
                        style: textTheme.bodyLarge!.copyWith(height: 1.5),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Mobile number',
                          hintStyle: textTheme.labelLarge,
                        ),
                      ),
                    )
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                Text(
                  'By enrolling your mobile phone number, you concent to receive automated security notifications via text message from Amazon.\nMessage and data rates may apply.',
                  style: textTheme.bodySmall,
                ),
                CommonFunctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                CommonAuthButton(
                  buttonwidth: 0.85,
                  title: 'Continue',
                  onPressed: () {
                    AuthServices.receiveOTP(
                        context: context,
                        mobileNo:
                            '$currentCountryCode${mobileController.text.trim()}');
                  },
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ButtonStyle(
                //       padding: MaterialStateProperty.all<EdgeInsets>(
                //           const EdgeInsets.only(
                //               top: 8, bottom: 8, left: 100, right: 100)),
                //       backgroundColor: MaterialStateProperty.all<Color>(amber),
                //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //           RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               side: BorderSide(color: grey)))),
                //   child: Text(
                //     'Continue',
                //     style: textTheme.bodyLarge!
                //         .copyWith(fontWeight: FontWeight.w600),
                //   ),
                // ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing you agree to Amazon\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Conditions of use ',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Privacy Notice',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: greyShade3),
              ),
              color: greyShade1,
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      newUser = true;
                    });
                  },
                  child: Container(
                    height: height * 0.04,
                    width: width * 0.04,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: newUser ? secondaryColor : transparent,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(
                  0,
                  width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Sign In ',
                          style: textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Already a Customer? ',
                          style: textTheme.bodySmall)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomAuthWidget extends StatelessWidget {
  const BottomAuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Column(
        children: [
          Container(
            height: 1.5,
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [white, greyShade3, white])),
          ),
          CommonFunctions.blankSpace(
            height * 0.03,
            0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Condition of Use',
                  style: textTheme.labelLarge!.copyWith(color: blue)),
              CommonFunctions.blankSpace(
                1,
                width * 0.05,
              ),
              Text('Privacy Policy',
                  style: textTheme.labelLarge!.copyWith(color: blue)),
              CommonFunctions.blankSpace(
                1,
                width * 0.05,
              ),
              Text('Help', style: textTheme.labelLarge!.copyWith(color: blue)),
            ],
          ),
          CommonFunctions.blankSpace(height * 0.01, 1),
          Text(
            '   @ 1990-2024, Amazon.com, Inc. or its affiliaties',
            style: textTheme.labelSmall!.copyWith(color: grey),
          )
        ],
      ),
    );
  }
}

class CommonAuthButton extends StatelessWidget {
  CommonAuthButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.buttonwidth});
  String title;
  VoidCallback onPressed;
  double buttonwidth;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width * buttonwidth, height * 0.07),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: amber),
      child: Text(
        'Continue',
        style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
