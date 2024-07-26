import 'dart:developer';

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/controller/provider/users_product_provider/users_product_provider.dart';
import 'package:amazon/model/product_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDisplayScreen extends StatefulWidget {
  const ProductDisplayScreen({super.key});

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen> {
  TextEditingController searchController = TextEditingController();

  getDay(int dayNum) {
    switch (dayNum % 7) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
        return 'Saturday';
      case 6:
        return 'Sunday';
      default:
        'Sunday';
    }
  }

  getMonth(int deliveryMonth, int deliveryDate) {
    deliveryDate = deliveryDate + 10;
    if (deliveryDate > 30) {
      deliveryMonth = deliveryMonth + 1;
      log(deliveryMonth.toString());

      if (deliveryMonth == 1) {
        return 'January';
        // } else if (deliveryMonth == 2) {
        //   return 'February';
      } else if (deliveryMonth == 3) {
        return 'March';
      } else if (deliveryMonth == 4) {
        return 'April';
      } else if (deliveryMonth == 5) {
        return 'May';
      } else if (deliveryMonth == 6) {
        return 'June';
      } else if (deliveryMonth == 7) {
        return 'July';
      } else if (deliveryMonth == 8) {
        return 'August';
      } else if (deliveryMonth == 9) {
        return 'September';
      } else if (deliveryMonth == 10) {
        return 'October';
      } else if (deliveryMonth == 11) {
        return 'November';
      } else if (deliveryMonth == 12) {
        return 'December';
      } else if (deliveryMonth > 12) {
        return 'January';
      }
    } else if (deliveryMonth == 2) {
      if (deliveryDate > 28) {
        return 'March';
      } else {
        return 'Febuary';
      }
    } else {
      if (deliveryMonth == 1) {
        return 'January';
      } else if (deliveryMonth == 2) {
        return 'February';
      } else if (deliveryMonth == 3) {
        return 'March';
      } else if (deliveryMonth == 4) {
        return 'April';
      } else if (deliveryMonth == 5) {
        return 'May';
      } else if (deliveryMonth == 6) {
        return 'June';
      } else if (deliveryMonth == 7) {
        return 'July';
      } else if (deliveryMonth == 8) {
        return 'August';
      } else if (deliveryMonth == 9) {
        return 'September';
      } else if (deliveryMonth == 10) {
        return 'October';
      } else if (deliveryMonth == 11) {
        return 'November';
      } else if (deliveryMonth == 12) {
        return 'December';
      }
    }
    // log('new ${DateTime.now().month.toString()}');
    // log(deliveryDate.toString());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsersProductProvider>().emptySearchedProductsList();
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
              preferredSize: Size(width, height * 0.1),
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
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: black,
                        )),
                    SizedBox(
                      width: width * 0.7,
                      // height: height * 0.07,
                      child: TextField(
                        controller: searchController,
                        onSubmitted: (productName) {
                          // log(productName);
                          context
                              .read<UsersProductProvider>()
                              .getSearchedProducts(productName: productName);
                        },
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: width * 0.03),
                            filled: true,
                            fillColor: white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mic,
                          color: black,
                        )),
                  ],
                ),
              )),
          body: Consumer<UsersProductProvider>(
            builder: (context, usersProductProvider, child) {
              if (usersProductProvider.productsFetched == false) {
                return const SizedBox();
              } else if (usersProductProvider.searchedProducts.isEmpty) {
                return const Center(
                  child: Text('Opps, Product not found'),
                );
              } else {
                return ListView.builder(
                  itemCount: usersProductProvider.searchedProducts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ProductModel currentProduct =
                        usersProductProvider.searchedProducts[index];
                    return Container(
                      height: height * 0.4,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: greyShade3)),
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.02, vertical: height * 0.007),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: greyShade2,
                              child: Image.network(
                                currentProduct.productImagesURL![0],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentProduct.productName ?? '',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  CommonFunctions.blankSpace(height * 0.005, 0),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '0.0',
                                        style: textTheme.bodyMedium!
                                            .copyWith(color: teal),
                                      ),
                                      CommonFunctions.blankSpace(
                                          0, width * 0.01),
                                      RatingBar(
                                        initialRating: 0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: width * 0.06,
                                        ratingWidget: RatingWidget(
                                          full: Icon(
                                            Icons.star,
                                            color: amber,
                                          ),
                                          half: Icon(
                                            Icons.star_half,
                                            color: amber,
                                          ),
                                          empty: Icon(
                                            Icons.star_outline_sharp,
                                            color: amber,
                                          ),
                                        ),
                                        itemPadding: EdgeInsets.zero,
                                        onRatingUpdate: (rating) {},
                                      ),
                                      CommonFunctions.blankSpace(
                                          0, width * 0.02),
                                      Text(
                                        '(0)',
                                        style: textTheme.bodyMedium!
                                            .copyWith(color: black),
                                      ),
                                    ],
                                  ),
                                  CommonFunctions.blankSpace(height * 0.01, 0),
                                  RichText(
                                    maxLines: 2,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: 'Rs ',
                                          style: textTheme.bodySmall),
                                      TextSpan(
                                        text: currentProduct.discountedPrice!
                                            .toStringAsFixed(0),
                                        style: textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      TextSpan(
                                          text: '\tMRP',
                                          style: textTheme.labelSmall!
                                              .copyWith(color: grey)),
                                      TextSpan(
                                          text:
                                              '\tRs${currentProduct.productPrice!.toStringAsFixed(0)}',
                                          style: textTheme.labelMedium!
                                              .copyWith(
                                                  color: grey,
                                                  decoration: TextDecoration
                                                      .lineThrough)),
                                      TextSpan(
                                          text:
                                              '\t{${currentProduct.discountPercentage!.toStringAsFixed(0)}}% off',
                                          style: textTheme.labelSmall!
                                              .copyWith(color: grey)),
                                    ]),
                                  ),
                                  Text(
                                    'Save extra with No cost EMI',
                                    style: textTheme.labelSmall!
                                        .copyWith(color: grey),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Get it by ',
                                        style: textTheme.labelSmall!
                                            .copyWith(color: grey)),
                                    TextSpan(
                                        text:
                                            getDay(DateTime.now().weekday + 3),
                                        style: textTheme.labelSmall!.copyWith(
                                            color: black,
                                            fontWeight: FontWeight.w600)),
                                    TextSpan(
                                        text: ', ${DateTime.now().day + 3} ',
                                        style: textTheme.labelSmall!.copyWith(
                                            color: black,
                                            fontWeight: FontWeight.w600)),
                                    TextSpan(
                                        text: getMonth(2, 18),
                                        style: textTheme.labelSmall!.copyWith(
                                            color: black,
                                            fontWeight: FontWeight.w600)),
                                  ]))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
