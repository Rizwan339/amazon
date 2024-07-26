// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/controller/provider/product_provider/product_provider.dart';
import 'package:amazon/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../../constants/constants.dart';

class ProductServices {
  static Future getImages({required BuildContext context}) async {
    List<File> selectedImages = [];
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickMultiImage(imageQuality: 100);
    List<XFile> filePick = pickedFile;

    if (filePick.isNotEmpty) {
      for (var i = 0; i < filePick.length; i++) {
        selectedImages.add(File(filePick[i].path));
      }
    } else {
      CommonFunctions.showToast(context: context, message: 'No Image Selected');
    }
    log('The Images are \n${selectedImages.toList().toString()}');
    return selectedImages;
  }

  static uploadImageToFirebaseStorage(
      {required List<File> images, required BuildContext context}) async {
    List<String> imagesUrl = [];
    String sellerUID = auth.currentUser!.phoneNumber!;
    Uuid uuid = const Uuid();

    await Future.forEach(
      images,
      (image) async {
        String imageName = '$sellerUID${uuid.v1().toString()}';

        Reference ref = FirebaseStorage.instance
            .ref()
            .child('Product Images')
            .child(imageName);
        await ref.putFile(File(image.path));
        String imageUrl = await ref.getDownloadURL();
        imagesUrl.add(imageUrl);
      },
    );
    log(imagesUrl.toList().toString());
    context
        .read<SellerProductProvider>()
        .updateProductImagesUrl(imageUrls: imagesUrl);
  }

  static Future addProduct({
    required BuildContext context,
    required ProductModel productModel,
  }) async {
    try {
      await firestore
          .collection('Products')
          .doc(productModel.productID)
          .set(productModel.toMap())
          .whenComplete(() {
        log('Data Added');
        Navigator.pop(context);
        CommonFunctions.showToast(
            context: context, message: 'Product Added Successfully');
      });
    } catch (e) {
      log(e.toString());
      if (!context.mounted) return;
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }

  static Future<List<ProductModel>> getSellersProducts() async {
    List<ProductModel> sellersproducts = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Products')
          .orderBy('uploadedAt', descending: true)
          .where('productSellerID', isEqualTo: auth.currentUser!.phoneNumber)
          .get();

      for (var element in snapshot.docs) {
        sellersproducts.add(ProductModel.fromMap(element.data()));
        // ProductModel products = ProductModel.fromMap(element.data());
      }
      log(sellersproducts.toList().toString());
    } catch (e) {
      log('Error found');
      log(e.toString());
    }
    log(sellersproducts.toList().toString());
    return sellersproducts;
  }
}
