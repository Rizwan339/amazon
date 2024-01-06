// import 'package:shoppy_world/utils/colors.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(
  brightness: Brightness.light,
  // appBarTheme: AppBarTheme(
  //   backgroundColor: amber,
  // ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 26,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 24,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 22,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontSize: 12,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: amber),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
    ),
  ),
  //  elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //    backgroundColor: MaterialStatePropertyAll(
  //     Color.fromARGB(255, 21, 197, 124)
  //    )
  //   )
  //  ),
  iconTheme: IconThemeData(color: amber),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 5, 70, 102),
  //  appBarTheme: AppBarTheme(
  //   backgroundColor: Colors.lightBlue
  //  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 26,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 24,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 22,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontSize: 12,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.yellow),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.green),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
    ),
  ),
  //  elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //    backgroundColor: MaterialStatePropertyAll(
  //     Colors.lightBlue
  //     // Color.fromARGB(255, 21, 197, 124)
  //    )
  //   )
  //  )
);
