import 'dart:developer';

import 'package:amazon/constants/constants.dart';
import 'package:amazon/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersProductServices {
  static Future<List<ProductModel>> getSellingProducts(
      String productName) async {
    List<ProductModel> sellingproducts = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Products')
          .orderBy('productName')
          .startAt([productName.toUpperCase()]).endAt(
              ['${productName.toLowerCase()}\uf8ff']).get();

      for (var element in snapshot.docs) {
        sellingproducts.add(ProductModel.fromMap(element.data()));
        // ProductModel products = ProductModel.fromMap(element.data());
      }
      log(sellingproducts.toList().toString());
    } catch (e) {
      log('Error found');
      log(e.toString());
    }
    log(sellingproducts.toList().toString());
    return sellingproducts;
  }
}
