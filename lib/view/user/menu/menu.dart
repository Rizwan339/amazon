import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: const HomePageAppBar(),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.02),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: appBarGradientColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: Column(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7),
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/menu_pics/$index.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: greyShade3)),
                    );
                  },
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: height * 0.003),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      height: height * 0.06,
                      width: width,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: teal)),
                      child: Row(
                        children: [
                          Text(
                            index == 0 ? "Settings" : "Customer Service",
                            style: textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: black,
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
