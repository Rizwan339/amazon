import 'dart:developer';
import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealController = CarouselController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: HomePageAppBar(width: width, height: height),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenUserAddressBar(height: height, width: width),
              CommonFunctions.divider(),
              HomeScreenCategoriesList(height: height, width: width),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonFunctions.divider(),
              HomeScreenBanner(height: height),
              SizedBox(
                width: width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '50%-80% Off | Latest deals.',
                        style: textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      CarouselSlider(
                        carouselController: todaysDealController,
                        options: CarouselOptions(
                            height: height * 0.28,
                            autoPlay: true,
                            viewportFraction: 1),
                        items: todaysDeals.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/todays_deals/$i"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      CommonFunctions.blankSpace(height * 0.01, 0),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: red),
                            child: Text(
                              "Upto 62% Off",
                              style:
                                  textTheme.bodySmall!.copyWith(color: white),
                            ),
                          ),
                          CommonFunctions.blankSpace(0, width * 0.03),
                          Text(
                            "Deal of the Day",
                            style: textTheme.bodySmall!.copyWith(
                                color: red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      CommonFunctions.blankSpace(height * 0.01, 0),
                      GridView.builder(
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 20),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                log(index.toString());
                                todaysDealController.animateToPage(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: greyShade3),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/todays_deals/${todaysDeals[index]}"),
                                      fit: BoxFit.contain),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: height * 0.28, autoPlay: true, viewportFraction: 1),
      items: carouselPictures.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage("assets/images/carousel_slideshow/$i"),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  const HomeScreenCategoriesList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(
                      'assets/images/categories/${categories[index]}.png'),
                  height: height * 0.07,
                ),
                Text(
                  categories[index],
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenUserAddressBar extends StatelessWidget {
  const HomeScreenUserAddressBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: addressBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
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
    );
  }
}
