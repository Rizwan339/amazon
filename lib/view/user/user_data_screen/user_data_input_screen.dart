import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/user_data_crud_services/user_data_crud_services.dart';
import 'package:amazon/model/user_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneController.text = auth.currentUser?.phoneNumber ?? '';
    });
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
        body: Container(
          // height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help us about knowing You more',
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Enter Your Name',
                style: textTheme.bodyMedium,
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              SizedBox(
                height: height * 0.08,
                child: TextField(
                  controller: nameController,
                  // cursorHeight: 25,
                  cursorColor: black,
                  style: textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'First and Last Name',
                    hintStyle: textTheme.bodySmall!.copyWith(height: 5),
                  ),
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              Text(
                'Phone Number',
                style: textTheme.bodyMedium,
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              SizedBox(
                height: height * 0.08,
                child: TextField(
                  controller: phoneController,
                  readOnly: true,
                  // cursorHeight: 25,
                  cursorColor: black,
                  style: textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: textTheme.bodySmall!.copyWith(height: 5),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  UserModel userModel = UserModel(
                    name: nameController.text.trim(),
                    mobileNum: phoneController.text.trim(),
                    userType: 'user',
                  );
                  await UserDataCrud.addNewUser(
                      userModel: userModel, context: context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(width, height * 0.08)),
                child: Text(
                  'Proceed',
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
