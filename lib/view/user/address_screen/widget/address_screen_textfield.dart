import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

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
