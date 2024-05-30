import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/colors.dart';

Future<File?> imageUploadCamera() async {
  try {
    final XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 90);
    if (file != null) {
      return File(file.path);
    } else {
      // User canceled image selection
      return null;
    }
  } catch (e) {
    // Handle specific exception for camera access denied
    if (e is PlatformException && e.code == 'camera_access_denied') {
      // Show a user-friendly message
      print(
          "User denied access to the camera. Please enable camera access in settings.");
    } else {
      // Handle other exceptions
      print("Error selecting image from camera: $e");
    }
    return null;
  }
}

Future<File?> fileUploadGallery({bool isSvg = false}) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: isSvg
            ? ["svg", "SVG"]
            : ["png", "PNG", "jpg", "JPG", "jpeg", "JPEG", "gif"]);

    if (result != null) {
      return File(result.files.single.path!);
    } else {
      // User canceled file selection
      return null;
    }
  } catch (e) {
    // Handle specific exceptions or provide a generic error message
    print("Error selecting file from gallery: $e");
    return null;
  }
}

// selectMultipleImage() async {
//   final FilePickerResult? results = await FilePicker.platform.pickFiles(
//     type: FileType.image,
//     allowMultiple: true,
//   );

//   if (results != null) {
//     List<File> selectedImages = results!.files.map((file) => File(file.path!)).toList();
//     // Process the selected images here
//   }
// }

showBottomMenu(imageUploadCamera(), fileUploadGallery()) {
  Get.bottomSheet(
    backgroundColor: Colors.white,
    Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: const Text(
              "اختار صورة",
              style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            onTap: () {
              imageUploadCamera();
              Get.back();
            },
            leading: const Icon(
              Icons.camera_alt,
              size: 40,
            ),
            title: const Text(
              "الكاميرا",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              fileUploadGallery();
              Get.back();
            },
            leading: const Icon(
              Icons.image,
              size: 40,
            ),
            title: const Text(
              "المعرض",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    ),
  );
}
