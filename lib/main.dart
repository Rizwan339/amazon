import 'package:amazon/controller/provider/address_provider/address_provider.dart';
import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/controller/provider/product_provider/product_provider.dart';
import 'package:amazon/controller/provider/users_product_provider/users_product_provider.dart';
import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/auth_screen/signInLogic.dart';
import 'package:amazon/view/seller/add_products/add_products_screen.dart';
import 'package:amazon/view/seller/seller_nav_bar/seller_navbar.dart';
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
        ChangeNotifierProvider<AddressProvider>(
            create: (_) => AddressProvider()),
        ChangeNotifierProvider<SellerProductProvider>(
            create: (_) => SellerProductProvider()),
        ChangeNotifierProvider<UsersProductProvider>(
            create: (_) => UsersProductProvider()),
      ],
      child: MaterialApp(
        theme: themeData,
        // home: const AddProductsScreen(),
        home: const SignInLogic(),
        // home: const SellerNavBar(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
