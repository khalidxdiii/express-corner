import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadImagesScreen extends StatefulWidget {
  @override
  _UploadImagesScreenState createState() => _UploadImagesScreenState();
}

class _UploadImagesScreenState extends State<UploadImagesScreen> {
  List<XFile>? _images = [];

  Future<void> pickAndUploadImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://express-corner.com/orders/testim.php'));
      request.fields['orderId'] = '77';

      for (var image in images) {
        request.files
            .add(await http.MultipartFile.fromPath('images[]', image.path));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Images uploaded successfully');
      } else {
        print('Failed to upload images');
      }
    }
  }

  Future pickImages() async {
    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      setState(() {
        _images = selectedImages;
      });
    }
  }

  Future uploadImages() async {
    var uri =
        Uri.parse('https://express-corner.com/orders/uploadMultipleImages.php');
    var request = http.MultipartRequest('POST', uri)
      ..fields['orderId'] = '76'; // Set your order ID here

    _images!.forEach((image) async {
      request.files
          .add(await http.MultipartFile.fromPath('images[]', image.path));
    });

    var response = await request.send();

    // Listen for response from server
    response.stream.transform(utf8.decoder).listen((value) {
      print(value); // Print the raw JSON response from the server
      final responseJson = jsonDecode(value); // Decode the JSON response
      print(responseJson); // Print the decoded response

      // Optionally, show the response in a dialog or snackbar
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Upload Response"),
            content: Text(value), // Showing raw response for simplicity
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Uploaded Successfully!');
    } else {
      print('Upload Failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Images'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: pickImages,
              child: Text('Pick Images'),
            ),
            ElevatedButton(
              onPressed: pickAndUploadImages,
              child: Text('Upload Images'),
            ),
          ],
        ),
      ),
    );
  }
}
