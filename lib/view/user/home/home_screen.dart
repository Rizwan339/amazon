import 'dart:developer';
import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/provider/address_provider/address_provider.dart';
import 'package:amazon/controller/user_data_crud_services/user_data_crud_services.dart';
import 'package:amazon/model/address_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/seller/add_products/add_products_screen.dart';
import 'package:amazon/view/user/address_screen/user_address_screen.dart';
import 'package:amazon/view/user/product_display_screen/product_display_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealController = CarouselController();

  checkUserAddress() async {
    bool userAddressPresent = await UserDataCrud.checkUsersAddress();
    log('user Address Present : ${userAddressPresent.toString()}');
    if (!mounted) return;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    if (userAddressPresent == false) {
      showModalBottomSheet(
        backgroundColor: transparent,
        context: context,
        builder: (context) {
          return Container(
            height: height * 0.4,
            padding: EdgeInsets.symmetric(
                vertical: height * 0.04, horizontal: width * 0.03),
            width: width,
            decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Address',
                  style: textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),
                SizedBox(
                  height: height * 0.2,
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const UserAddressScreen(),
                                    type: PageTransitionType.rightToLeft));
                          }
                        },
                        child: Container(
                          width: width * 0.3,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.01),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: greyShade3)),
                          child: Builder(
                            builder: (context) {
                              if (index == 0) {
                                return Text(
                                  'Add Address',
                                  style: textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: greyShade3),
                                );
                              }
                              return Text(
                                'Add Address',
                                style: textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: greyShade3),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  gridHeadphoneDealsFunc(int index) {
    switch (index) {
      case 0:
        return "Bose";
      case 1:
        return "boAt";
      case 2:
        return "Sony";
      case 3:
        return "OnePlus";
    }
  }

  gridClothingDealsFunc(int index) {
    switch (index) {
      case 0:
        return "Kurtas,saress&more";
      case 1:
        return "Tops, dresses & more";
      case 2:
        return "T-Shirt, Jeans & more";
      case 3:
        return "View all";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserAddress();
      context.read<AddressProvider>().getCurrentSelectedAddress();
    });
  }

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
          child: Column(
            children: [
              const HomeScreenUserAddressBar(),
              CommonFunctions.divider(),
              const HomeScreenCategoriesList(),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonFunctions.divider(),
              const HomeScreenBanner(),
              TodaysDealsHomeScreenWidget(
                  todaysDealController: todaysDealController),
              CommonFunctions.divider(),
              gridViewDealsMethod(
                  title: 'Latest Launches in Headphones',
                  textButtonName: 'Explore more',
                  dealPicsNames: headphonesDeals,
                  offerFor: 'headphones'),
              CommonFunctions.divider(),
              HomeScreenAdsWidget(height: height, width: width),
              gridViewDealsMethod(
                  title: 'Minimum 70% Off | Top Offers on Clothing',
                  textButtonName: 'See all Deals',
                  dealPicsNames: clothingDealsList,
                  offerFor: 'clothing'),
              CommonFunctions.divider(),
              HomeScreenMiniTvWidget(
                  height: height, width: width, textTheme: textTheme)
            ],
          ),
        ),
      ),
    );
  }

  Container gridViewDealsMethod({
    required String title,
    required String textButtonName,
    required List<String> dealPicsNames,
    required String offerFor,
  }) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.01),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
          CommonFunctions.blankSpace(height * 0.01, 0),
          GridView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyShade3),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/offersNsponcered/${dealPicsNames[index]}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Text(
                        offerFor == 'headphones'
                            ? gridHeadphoneDealsFunc(index)
                            : gridClothingDealsFunc(index),
                        style: textTheme.labelMedium,
                      ),
                    ],
                  ),
                );
              }),
          TextButton(
            onPressed: () {},
            child: Text(
              textButtonName,
              style: textTheme.bodySmall!.copyWith(color: blue),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenMiniTvWidget extends StatelessWidget {
  const HomeScreenMiniTvWidget({
    super.key,
    required this.height,
    required this.width,
    required this.textTheme,
  });

  final double height;
  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonFunctions.blankSpace(height * 0.01, 0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Text(
            'Watch Sixer only on MiniTV',
            style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: height * 0.5,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.01,
          ),
          child: const Image(
            image: AssetImage("assets/images/offersNsponcered/sixer.png"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

class HomeScreenAdsWidget extends StatelessWidget {
  const HomeScreenAdsWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.4,
      width: width,
      child: const Image(
        image: AssetImage("assets/images/offersNsponcered/insurance.png"),
        fit: BoxFit.fill,
      ),
    );
  }
}

class TodaysDealsHomeScreenWidget extends StatelessWidget {
  const TodaysDealsHomeScreenWidget({
    super.key,
    required this.todaysDealController,
  });

  final CarouselController todaysDealController;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '50%-80% Off | Latest deals.',
              style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
            ),
            CarouselSlider(
              carouselController: todaysDealController,
              options: CarouselOptions(
                  height: height * 0.28, autoPlay: true, viewportFraction: 1),
              items: todaysDeals.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: white,
                        image: DecorationImage(
                          image: AssetImage("assets/images/todays_deals/$i"),
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
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: red),
                  child: Text(
                    "Upto 62% Off",
                    style: textTheme.bodySmall!.copyWith(color: white),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 0.03),
                Text(
                  "Deal of the Day",
                  style: textTheme.bodySmall!
                      .copyWith(color: red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            GridView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
            TextButton(
              onPressed: () {},
              child: Text(
                "See all Deals",
                style: textTheme.bodySmall!.copyWith(color: blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
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
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                  style: const TextStyle(fontSize: 10),
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
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
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
      child: Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
          if (addressProvider.fetchedCurrentSelectedAddress &&
              addressProvider.addressPresent) {
            AddressModel selectedAddress =
                addressProvider.currentSelectedAddress;
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(
                    Icons.location_pin,
                    color: black,
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .02),
                Text(
                  'Deleiver to ${selectedAddress.name} - ${selectedAddress.town}, ${selectedAddress.state}',
                  style: textTheme.bodySmall,
                )
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(
                    Icons.location_pin,
                    color: black,
                  ),
                ),
                CommonFunctions.blankSpace(0, width * .02),
                Text(
                  'Deleiver to User - City, State',
                  style: textTheme.bodySmall,
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const ProductDisplayScreen(),
                        type: PageTransitionType.rightToLeft));
              },
              child: Container(
                width: width * 0.8,
                height: height * 0.06,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: grey),
                  color: white,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.03),
                      child: Text('Search Amazon.in',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: grey)),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.camera_alt_sharp,
                      color: grey,
                    ),
                  ],
                ),
              )),
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
