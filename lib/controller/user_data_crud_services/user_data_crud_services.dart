import 'dart:math' as prefix;
import 'dart:developer';
import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/model/address_model.dart';
import 'package:amazon/model/user_model.dart';
import 'package:amazon/view/auth_screen/signInLogic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uuid/uuid.dart';

class UserDataCrud {
  static addNewUser(
      {required UserModel userModel, required BuildContext context}) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser?.phoneNumber)
          .set(userModel.toMap())
          .whenComplete(() {
        log('Data Added');
        CommonFunctions.showToast(
            context: context, message: "User Added Successfully");
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const SignInLogic(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
      });
    } catch (e) {
      log(e.toString());
      if (!context.mounted) return;
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUser() async {
    bool userPresence = false;
    try {
      await firestore
          .collection('users')
          .where('mobileNum', isEqualTo: auth.currentUser?.phoneNumber)
          .get()
          .then((value) =>
              value.size > 0 ? userPresence = true : userPresence = false);
    } catch (e) {
      log(e.toString());
    }
    log(userPresence.toString());
    return userPresence;
  }

  static Future addUserAddress(
      {required BuildContext context,
      required AddressModel addressModel,
      required String docID}) async {
    try {
      await firestore
          .collection('Address')
          .doc(auth.currentUser?.phoneNumber)
          .collection('address')
          .doc(docID)
          .set(addressModel.toMap())
          .whenComplete(() {
        log('Data Added');
        CommonFunctions.showToast(
            context: context, message: "Address Added Successfully");
        Navigator.pop(context);
      });
    } catch (e) {
      log(e.toString());
      if (!context.mounted) return;
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }

  static Future<bool> checkUsersAddress() async {
    bool addressPresence = false;
    try {
      await firestore
          .collection('Address')
          .doc(auth.currentUser?.phoneNumber)
          .collection('address')
          .get()
          .then((value) => value.size > 0
              ? addressPresence = true
              : addressPresence = false);
      log(addressPresence.toString());
    } catch (e) {
      log(e.toString());
    }
    log(addressPresence.toString());
    return addressPresence;
  }

  static Future<List<AddressModel>> getAllAdrresses() async {
    List<AddressModel> allAddresses = [];
    AddressModel defaultAddress = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser?.phoneNumber)
          .collection('address')
          .get();

      for (var element in snapshot.docs) {
        allAddresses.add(AddressModel.fromMap(element.data()));
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if (currentAddress.isDefault == true) {
          defaultAddress = currentAddress;
        }
      }
    } catch (e) {
      log('Error found');
      log(e.toString());
    }
    for (var data in allAddresses) {
      log(data.toMap().toString());
    }
    return allAddresses;
  }

  static Future getCurrentSelectedAddress() async {
    AddressModel defaultAddress = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser?.phoneNumber)
          .collection('address')
          .get();

      for (var element in snapshot.docs) {
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if (currentAddress.isDefault == true) {
          defaultAddress = currentAddress;
          break;
        }
      }
    } catch (e) {
      log('Error found');
      log(e.toString());
    }
    return defaultAddress;
  }
}
