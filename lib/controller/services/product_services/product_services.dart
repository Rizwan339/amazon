import 'dart:developer';
import 'dart:io';
import 'package:amazon/constants/common_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../constants/constants.dart';

class ProductServices {
  static Future getImages({required BuildContext context}) async {
    List<File> selectedImages = [];
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickMultiImage(imageQuality: 100);
    List<XFile> filePick = pickedFile;

    if (filePick.isNotEmpty) {
      for (var i = 0; i < filePick.length; i++) {
        selectedImages.add(File(filePick[i].path));
      }
    } else {
      CommonFunctions.showToast(context: context, message: 'No Image Selected');
    }
    log('The Images are \n${selectedImages.toList().toString()}');
    return selectedImages;
  }

  static uploadImageToFirebaseStorage(
      {required List<File> images, required BuildContext context}) async {
    List<String> imagesUrl = [];
    String sellerUID = auth.currentUser!.phoneNumber!;
    Uuid uuid = const Uuid();

    await Future.forEach(
      images,
      (image) async {
        String imageName = '$sellerUID${uuid.v1().toString()}';

        Reference ref = FirebaseStorage.instance
            .ref()
            .child('Product Images')
            .child(imageName);
        await ref.putFile(File(image.path));
        String imageUrl = await ref.getDownloadURL();
        imagesUrl.add(imageUrl);
      },
    );
  }
}
