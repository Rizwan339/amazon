import 'dart:developer';

import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:amazon/controller/user_data_crud_services/user_data_crud_services.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/user/user_data_screen/user_data_input_screen.dart';
import 'package:amazon/view/user/user_navbar/user_navbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
// import '../user/home/home_screen.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkUser() async {
    bool userExist = await UserDataCrud.checkUser();
    log(userExist.toString());
    if (userExist == true) {
      if (!mounted) return;
      Navigator.push(
        context,
        PageTransition(
            child: BottomNavBar(), type: PageTransitionType.rightToLeft),
      );
    } else {
      if (!mounted) return;
      Navigator.push(
        context,
        PageTransition(
            child: const UserDataInputScreen(),
            type: PageTransitionType.rightToLeft),
      );
    }
  }

  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.chekAuthentication();
    userIsAuthenticated
        ? checkUser()
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const AuthScreen(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuthentication();
      checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/amazon_splash_screen.png'),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
