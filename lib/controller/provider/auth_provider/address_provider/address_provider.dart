import 'package:amazon/controller/user_data_crud_services/user_data_crud_services.dart';
import 'package:amazon/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressModel> allAddressModel = [];
  AddressModel currentSelectedAddress = AddressModel();
  bool fetchedCurrentSelectedAddress = false;
  bool fetchedAllAddresses = false;

  getAllAddresses() async {
    allAddressModel = await UserDataCrud.getAllAdrresses();
    fetchedAllAddresses = true;
    notifyListeners();
  }

  getCurrentSelectedAddress() async {
    currentSelectedAddress = await UserDataCrud.getCurrentSelectedAddress();
    fetchedCurrentSelectedAddress = true;
    notifyListeners();
  }
}
