import 'dart:io';

import 'package:amazon/controller/services/product_services/product_services.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<File> productImages = [];
  List<String> productImagesUrl = [];

  fetchProductImagesFromGallery({required BuildContext context}) async {
    productImages = await ProductServices.getImages(context: context);
    notifyListeners();
  }

  updateProductImagesUrl({required List<String> imageUrls}) async {
    productImagesUrl = imageUrls;
    notifyListeners();
  }
}
