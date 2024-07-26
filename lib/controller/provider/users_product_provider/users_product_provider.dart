import 'package:amazon/controller/users_product_services/users_product_services.dart';
import 'package:amazon/model/product_model.dart';
import 'package:flutter/material.dart';

class UsersProductProvider extends ChangeNotifier {
  List<ProductModel> searchedProducts = [];

  bool productsFetched = false;

  emptySearchedProductsList() {
    searchedProducts = [];
    notifyListeners();
  }

  getSearchedProducts({required String productName}) async {
    searchedProducts =
        await UsersProductServices.getSellingProducts(productName);
    productsFetched = true;
    notifyListeners();
  }
}
