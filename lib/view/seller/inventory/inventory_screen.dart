import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/controller/provider/product_provider/product_provider.dart';
import 'package:amazon/model/product_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/seller/add_products/add_products_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SellerProductProvider>().fetchSellerProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const AddProductsScreen(),
                    type: PageTransitionType.rightToLeft));
          },
          backgroundColor: amber,
          child: Icon(
            Icons.add,
            color: black,
          ),
        ),
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
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<SellerProductProvider>(
                    builder: (context, sellerProductProvider, child) {
                  if (sellerProductProvider.sellerProductsFetched == false) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (sellerProductProvider.products.isEmpty) {
                    return Center(
                      child: Text(
                        'No Products Found',
                        style: textTheme.bodyMedium,
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount: sellerProductProvider.products.length,
                      shrinkWrap: true,
                      physics: const PageScrollPhysics(),
                      itemBuilder: (context, index) {
                        ProductModel currentModel =
                            sellerProductProvider.products[index];
                        return Container(
                          height: height * 0.32,
                          width: width,
                          margin: EdgeInsets.symmetric(vertical: height * 0.01),
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.01),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: grey)),
                          child: Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                    height: height * 0.2,
                                    autoPlay: true,
                                    viewportFraction: 1),
                                items: currentModel.productImagesURL!.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: white,
                                          image: DecorationImage(
                                            image: NetworkImage(i),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentModel.productName!,
                                          style: textTheme.bodyMedium!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          currentModel.productDescriptions!,
                                          maxLines: 2,
                                          style: textTheme.bodySmall!.copyWith(
                                              overflow: TextOverflow.ellipsis,
                                              color: grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CommonFunctions.blankSpace(height * 0.01, 0),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          currentModel.productPrice.toString(),
                                          style: textTheme.bodyMedium,
                                        ),
                                        Text(
                                          currentModel.inStock!
                                              ? 'in Stock'
                                              : 'Out of Stock',
                                          style: textTheme.bodySmall!.copyWith(
                                              color: currentModel.inStock!
                                                  ? teal
                                                  : red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
