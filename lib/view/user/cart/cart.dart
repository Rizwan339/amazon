import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
        body: Container(
          height: height,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.01),
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Subtotal ", style: textTheme.bodyMedium),
                      TextSpan(
                          text: "Rs 53,313",
                          style: textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: teal,
                    ),
                    CommonFunctions.blankSpace(0, width * 0.01),
                    Expanded(
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        "Your Order is eligible for FREE Delivery. ",
                                    style: textTheme.bodySmall!
                                        .copyWith(color: teal)),
                                TextSpan(
                                    text: "Select this option at checkout.",
                                    style: textTheme.bodySmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: amber,
                      minimumSize: Size(width, height * 0.07)),
                  child: Text(
                    "Proceed to Buy",
                    style: textTheme.bodyMedium,
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                CommonFunctions.divider(),
                CommonFunctions.blankSpace(height * 0.02, 0),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: height * 0.2,
                      width: width,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02, vertical: height * 0.01),
                      margin: EdgeInsets.symmetric(vertical: height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade1,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                      "assets/images/todays_deals/todaysDeal1.png"),
                                  fit: BoxFit.fitWidth,
                                ),
                                CommonFunctions.blankSpace(height * 0.01, 0),
                                Container(
                                  height: height * .06,
                                  width: width * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: greyShade3),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: greyShade3))),
                                            child: Icon(
                                              Icons.delete_outlined,
                                              color: black,
                                            ),
                                          )),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                            color: white,
                                            alignment: Alignment.center,
                                            child: const Text('1')),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    left: BorderSide(
                                                        color: greyShade3))),
                                            child: Icon(
                                              Icons.add,
                                              color: black,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          CommonFunctions.blankSpace(0, width * 0.02),
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product Name",
                                  style: textTheme.bodyLarge,
                                ),
                                CommonFunctions.blankSpace(height * 0.01, 0),
                                Text(
                                  "Rs 46,499",
                                  style: textTheme.displayMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                // CommonFunctions.blankSpace(height * 0.01, 0),
                                Text(
                                  "Eigible for FREE Shipping",
                                  style: textTheme.titleSmall,
                                ),
                                Text(
                                  "In Stock",
                                  style: textTheme.titleSmall!
                                      .copyWith(color: teal),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          backgroundColor: white,
                                          side: BorderSide(color: greyShade3)),
                                      onPressed: () {},
                                      child: Text(
                                        "Delete",
                                        style: textTheme.titleSmall,
                                      ),
                                    ),
                                    CommonFunctions.blankSpace(0, width * 0.03),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: white,
                                            side:
                                                BorderSide(color: greyShade3)),
                                        onPressed: () {},
                                        child: Text(
                                          "Save for Later",
                                          style: textTheme.titleSmall,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
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
