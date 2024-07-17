import 'dart:convert';

class ProductModel {
  final List<String>? productImagesURL;
  final String? productName;
  final String? category;
  final String? productDescriptions;
  final String? brandName;
  final String? manufactrerName;
  final String? countryOfOrigin;
  final String? productSpecifications;
  final double? productPrice;
  final String? productID;
  final String? productSellerID;
  final bool? inStock;

  ProductModel({
    this.productImagesURL,
    this.productName,
    this.category,
    this.productDescriptions,
    this.brandName,
    this.manufactrerName,
    this.countryOfOrigin,
    this.productSpecifications,
    this.productPrice,
    this.productID,
    this.productSellerID,
    this.inStock,
  });

  Map<String, dynamic> toMap() {
    return {
      'productImagesURL': productImagesURL,
      'productName': productName,
      'category': category,
      'productDescriptions': productDescriptions,
      'brandName': brandName,
      'manufactrerName': manufactrerName,
      'countryOfOrigin': countryOfOrigin,
      'productSpecifications': productSpecifications,
      'productPrice': productPrice,
      'productID': productID,
      'productSellerID': productSellerID,
      'inStock': inStock,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productImagesURL: List<String>.from(map['productImagesURL']),
      productName: map['productName'],
      category: map['category'],
      productDescriptions: map['productDescriptions'],
      brandName: map['brandName'],
      manufactrerName: map['manufactrerName'],
      countryOfOrigin: map['countryOfOrigin'],
      productSpecifications: map['productSpecifications'],
      productPrice: map['productPrice'],
      productID: map['productID'],
      productSellerID: map['productSellerID'],
      inStock: map['inStock'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
