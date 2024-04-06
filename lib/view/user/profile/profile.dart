import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(width, height * 0.1),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.01),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: appBarGradientColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Row(
                children: [
                  Image(
                    image:
                        const AssetImage("assets/images/amazon_black_logo.png"),
                    height: height * 0.06,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      color: black,
                      size: height * 0.04,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: black,
                      size: height * 0.04,
                    ),
                    color: black,
                  )
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Column(
              children: [
                ProfileScreenUserGreetingWidget(
                    width: width, textTheme: textTheme, height: height),
                CommonFunctions.blankSpace(height * 0.01, 0),
                ProfileScreenGridButtons(width: width, textTheme: textTheme),
                CommonFunctions.blankSpace(height * 0.02, 0),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.01),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Orders',
                            style: textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'See all',
                              style: textTheme.bodySmall!.copyWith(color: blue),
                            ),
                          ),
                        ],
                      ),
                      CommonFunctions.blankSpace(height * 0.01, 0),
                      SizedBox(
                        height: height * 0.18,
                        child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  border: Border.all(color: greyShade3),
                                  borderRadius: BorderRadius.circular(10)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileScreenGridButtons extends StatelessWidget {
  const ProfileScreenGridButtons({
    super.key,
    required this.width,
    required this.textTheme,
  });

  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3.4),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(50),
              color: greyShade2),
          alignment: Alignment.center,
          child: Builder(
            builder: (context) {
              if (index == 0) {
                return Text(
                  'Your Orders',
                  style: textTheme.labelMedium,
                );
              }
              if (index == 1) {
                return Text(
                  'Buy Again',
                  style: textTheme.labelMedium,
                );
              }
              if (index == 2) {
                return Text(
                  'Your Account',
                  style: textTheme.labelMedium,
                );
              }
              return Text(
                'Your Wish List',
                style: textTheme.labelMedium,
              );
            },
          ),
        );
      },
    );
  }
}

class ProfileScreenUserGreetingWidget extends StatelessWidget {
  const ProfileScreenUserGreetingWidget({
    super.key,
    required this.width,
    required this.textTheme,
    required this.height,
  });

  final double width;
  final TextTheme textTheme;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Row(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(text: 'Hello, ', style: textTheme.bodyLarge),
              TextSpan(
                  text: 'Rizwan',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
            ]),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: greyShade3,
            radius: height * 0.03,
            // child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
