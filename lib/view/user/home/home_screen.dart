import 'dart:developer';

import 'package:amazon/constants/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.01),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width * 0.79,
                  child: TextField(
                    onTap: () {
                      log('Redirecting you to product search screen');
                    },
                    cursorColor: black,
                    cursorHeight: 20,
                    style: const TextStyle(height: 1),
                    decoration: InputDecoration(
                      fillColor: white,
                      filled: true,
                      hintText: 'Search Amazon.in',
                      prefixIcon: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.search,
                            color: black,
                          )),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.camera_alt_sharp,
                            color: grey,
                          )),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.03),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: grey)),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: black,
                    )),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: addressBarGradientColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
                color: greyShade3,
              ),
              SizedBox(
                height: height * 0.09,
                width: width,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.009),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/categories/${categories[index]}.png'),
                              height: height * 0.06,
                            ),
                            Text(
                              categories[index],
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
