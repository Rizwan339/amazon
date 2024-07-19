// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/provider/product_provider/product_provider.dart';
import 'package:amazon/controller/services/product_services/product_services.dart';
import 'package:amazon/model/product_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/seller/add_products/Widget/product_details_textfiled.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionsController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController manufactrerNameController = TextEditingController();
  TextEditingController countryOfOriginController = TextEditingController();
  TextEditingController productSpecificationsController =
      TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productIDController = TextEditingController();
  TextEditingController productSellerIDController = TextEditingController();

  String dropDownValue = 'Select Category';
  bool addProductbuttonPressed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        addProductbuttonPressed = false;
      });
    });
  }

  onPressed() async {
    if (context.read<SellerProductProvider>().productImages.isNotEmpty) {
      setState(() {
        addProductbuttonPressed = true;
      });
      await ProductServices.uploadImageToFirebaseStorage(
          images: context.read<SellerProductProvider>().productImages,
          context: context);
      Uuid uuid = const Uuid();
      String sellerID = auth.currentUser!.phoneNumber!;
      String productID = '$sellerID${uuid.v1()}';

      List<String> imagesURLs =
          context.read<SellerProductProvider>().productImagesUrl;
      ProductModel model = ProductModel(
          productImagesURL: imagesURLs,
          productName: productNameController.text.trim(),
          category: dropDownValue,
          productDescriptions: productDescriptionsController.text.trim(),
          brandName: brandNameController.text.trim(),
          manufactrerName: manufactrerNameController.text.trim(),
          countryOfOrigin: countryOfOriginController.text.trim(),
          productSpecifications: productSpecificationsController.text.trim(),
          productPrice: double.parse(productPriceController.text.trim()),
          productID: productID,
          productSellerID: sellerID,
          inStock: true);

      await ProductServices.addProduct(context: context, productModel: model);
      CommonFunctions.showToast(
          context: context, message: "Product Added Successfully");
    }
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01, vertical: height * 0.02),
              child: Column(
                children: [
                  ProductImageBanner(
                      height: height, width: width, textTheme: textTheme),
                  CommonFunctions.blankSpace(height * 0.02, 0),
                  productDetailsTextFields(height, textTheme, width),
                  CommonFunctions.blankSpace(height * 0.02, 0),
                  ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(width, height * 0.07),
                      ),
                      child: addProductbuttonPressed
                          ? CircularProgressIndicator(
                              color: white,
                            )
                          : Text(
                              'Add Product',
                              style: textTheme.bodyMedium,
                            )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column productDetailsTextFields(
      double height, TextTheme textTheme, double width) {
    return Column(
      children: [
        AddProductTextField(
            textController: productNameController,
            title: 'Product Name',
            hintText: 'Name'),
        CommonFunctions.blankSpace(height * 0.01, 0),
        dropDownButton(textTheme, height, width),
        CommonFunctions.blankSpace(height * 0.01, 0),
        AddProductTextField(
            textController: productDescriptionsController,
            title: 'Description',
            hintText: 'Description'),
        CommonFunctions.blankSpace(height * 0.01, 0),
        AddProductTextField(
            textController: manufactrerNameController,
            title: 'Manufactrer Name',
            hintText: 'Name'),
        CommonFunctions.blankSpace(height * 0.01, 0),
        AddProductTextField(
            textController: brandNameController,
            title: 'Brand Name',
            hintText: 'Name'),
        CommonFunctions.blankSpace(height * 0.01, 0),
        AddProductTextField(
            textController: countryOfOriginController,
            title: 'Country of Origin',
            hintText: 'Country'),
        CommonFunctions.blankSpace(height * 0.01, 0),
        AddProductTextField(
            textController: productSpecificationsController,
            title: 'Product Specifications',
            hintText: 'Specifications'),
        CommonFunctions.blankSpace(height * 0.01, 0),
        AddProductTextField(
            textController: productPriceController,
            title: 'Product Price',
            hintText: 'Price'),
        CommonFunctions.blankSpace(height * 0.01, 0),
      ],
    );
  }

  Column dropDownButton(TextTheme textTheme, double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Category',
          style: textTheme.bodyMedium,
        ),
        CommonFunctions.blankSpace(height * 0.01, 0),
        Container(
          height: height * 0.08,
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: grey)),
          child: DropdownButton(
            value: dropDownValue,
            underline: const SizedBox(),
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: productCategories
                .map((String items) =>
                    DropdownMenuItem(value: items, child: Text(items)))
                .toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  dropDownValue = newValue;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}

class ProductImageBanner extends StatelessWidget {
  const ProductImageBanner({
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
    return Consumer<SellerProductProvider>(
        builder: (context, productProvider, child) {
      return Builder(
        builder: (context) {
          if (productProvider.productImages.isEmpty) {
            return InkWell(
              onTap: () {
                context
                    .read<SellerProductProvider>()
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
                      style: textTheme.bodyMedium!.copyWith(color: greyShade3),
                    )
                  ],
                ),
              ),
            );
          } else {
            List<File> images =
                context.read<SellerProductProvider>().productImages;
            return CarouselSlider(
              options: CarouselOptions(
                  height: height * 0.28, autoPlay: true, viewportFraction: 1),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: white,
                        image: DecorationImage(
                          image: FileImage(File(i.path)),
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          }
        },
      );
    });
  }
}
