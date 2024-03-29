import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/user/user_navbar/user_navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProviders>(create: (_) => AuthProviders()),
      ],
      child: MaterialApp(
        theme: themeData,
        home: BottomNavBar(),
        // home: OTPScreen(
        //   mobileNumber: '+92 3059691378',
        // ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
