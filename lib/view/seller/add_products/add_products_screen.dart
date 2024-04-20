import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/provider/product_provider/product_provider.dart';
import 'package:amazon/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
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
                  Text(
                    'Add Products',
                    style: textTheme.displaySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.01, vertical: height * 0.02),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  if (context.read<ProductProvider>().productImages.isEmpty) {
                    return InkWell(
                      onTap: () {
                        context
                            .read<ProductProvider>()
                            .fetchProductImagesFromGallery(context: context);
                      },
                      child: Container(
                        height: height * 0.25,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyShade3)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: height * 0.08,
                              color: greyShade3,
                            ),
                            Text(
                              'Add Products',
                              style: textTheme.bodyMedium!
                                  .copyWith(color: greyShade3),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Container(
                    height: height * 0.25,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: greyShade3)),
                  );
                },
              ),
              // CarouselSlider(
              //   options: CarouselOptions(
              //       height: height * 0.28, autoPlay: true, viewportFraction: 1),
              //   items: carouselPictures.map((i) {
              //     return Builder(
              //       builder: (BuildContext context) {
              //         return Container(
              //           width: MediaQuery.of(context).size.width,
              //           // margin: EdgeInsets.symmetric(horizontal: 5.0),
              //           decoration: BoxDecoration(
              //             color: Colors.amber,
              //             image: DecorationImage(
              //               image: AssetImage(
              //                   "assets/images/carousel_slideshow/$i"),
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
