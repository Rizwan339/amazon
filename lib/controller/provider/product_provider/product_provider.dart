import 'dart:io';

import 'package:amazon/controller/services/product_services/product_services.dart';
import 'package:amazon/model/product_model.dart';
import 'package:flutter/material.dart';

class SellerProductProvider extends ChangeNotifier {
  List<File> productImages = [];
  List<String> productImagesUrl = [];
  List<ProductModel> products = [];
  bool sellerProductsFetched = false;

  fetchProductImagesFromGallery({required BuildContext context}) async {
    productImages = await ProductServices.getImages(context: context);
    notifyListeners();
  }

  updateProductImagesUrl({required List<String> imageUrls}) async {
    productImagesUrl = imageUrls;
    notifyListeners();
  }

  fetchSellerProducts() async {
    products = await ProductServices.getSellersProducts();
    sellerProductsFetched = true;
    notifyListeners();
  }
}
