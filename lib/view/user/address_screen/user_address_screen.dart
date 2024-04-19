import 'dart:developer';

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/user_data_crud_services/user_data_crud_services.dart';
import 'package:amazon/model/address_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserAddressScreen extends StatefulWidget {
  const UserAddressScreen({super.key});

  @override
  State<UserAddressScreen> createState() => _AddressScreen();
}

class _AddressScreen extends State<UserAddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController stateController = TextEditingController();
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image:
                      const AssetImage("assets/images/amazon_black_logo.png"),
                  height: height * 0.06,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: width,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.02),
              child: Center(
                child: Column(
                  children: [
                    AddressScreenTextField(
                        textController: nameController,
                        title: 'Enter Your Name',
                        hintText: 'First and Last Name'),
                    CommonFunctions.blankSpace(height * 0.02, 0),
                    AddressScreenTextField(
                        textController: mobileNumController,
                        title: 'Enter Your Mobile Number',
                        hintText: 'Mobile Number'),
                    CommonFunctions.blankSpace(height * 0.02, 0),
                    AddressScreenTextField(
                        textController: houseNumController,
                        title: 'Enter Your House No.',
                        hintText: 'House No'),
                    CommonFunctions.blankSpace(height * 0.02, 0),
                    AddressScreenTextField(
                        textController: areaController,
                        title: 'Enter Your Area',
                        hintText: 'Area Name'),
                    CommonFunctions.blankSpace(height * 0.01, 0),
                    AddressScreenTextField(
                        textController: landMarkController,
                        title: 'Enter Your LandMark',
                        hintText: 'LandMark'),
                    CommonFunctions.blankSpace(height * 0.02, 0),
                    AddressScreenTextField(
                        textController: pincodeController,
                        title: 'Enter Your Pin Code',
                        hintText: 'Pin Code'),
                    CommonFunctions.blankSpace(height * 0.02, 0),
                    AddressScreenTextField(
                        textController: townController,
                        title: 'Enter Your Town',
                        hintText: 'Town'),
                    CommonFunctions.blankSpace(height * 0.02, 0),
                    AddressScreenTextField(
                        textController: stateController,
                        title: 'Enter Your State',
                        hintText: 'State'),
                    CommonFunctions.blankSpace(height * 0.04, 0),
                    ElevatedButton(
                      onPressed: () {
                        Uuid uuid = const Uuid();
                        String docID = uuid.v1();
                        AddressModel addressModel = AddressModel(
                          name: nameController.text.trim(),
                          mobileNum: mobileNumController.text.trim(),
                          authenticatedMobileNum: auth.currentUser?.phoneNumber,
                          houseNum: houseNumController.text.trim(),
                          area: areaController.text.trim(),
                          landMark: landMarkController.text.trim(),
                          pincode: pincodeController.text.trim(),
                          town: townController.text.trim(),
                          state: stateController.text.trim(),
                          docID: docID,
                          isDefault: true,
                        );
                        UserDataCrud.addUserAddress(
                            context: context,
                            addressModel: addressModel,
                            docID: docID);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(width, height * 0.08)),
                      child: Text(
                        'Add Address',
                        style: textTheme.bodyMedium,
                      ),
                    ),
                    CommonFunctions.blankSpace(height * 0.02, 0),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class AddressScreenTextField extends StatelessWidget {
  const AddressScreenTextField(
      {super.key,
      required this.textController,
      required this.title,
      required this.hintText});

  final TextEditingController textController;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium,
          ),
          CommonFunctions.blankSpace(height * 0.006, 0),
          SizedBox(
            height: height * 0.08,
            child: TextField(
              controller: textController,
              // cursorHeight: 25,
              cursorColor: black,
              style: textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: textTheme.bodySmall!.copyWith(height: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
