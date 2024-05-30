import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../functions/checkinternet.dart';
import 'statusRequest.dart';

String _basicAuth = 'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfsf'))}';
Map<String, String> _myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map resonsebody = jsonDecode(response.body);
          debugPrint(resonsebody.toString());
          return Right(resonsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> getDataWithParameters(
      String baseUrl, Map<String, dynamic> queryParams) async {
    try {
      // Check for internet connectivity
      if (await checkInternet()) {
        // Encode the query parameters
        String queryString = Uri(queryParameters: queryParams).query;
        var fullUrl = Uri.parse('$baseUrl?$queryString');

        // Make the GET request
        var response = await http.get(fullUrl, headers: _myheaders);
        debugPrint('Status code: ${response.statusCode}');

        // Process the response
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          debugPrint('Response body: $responseBody');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithMultiple(
      String url, Map<String, String> data, List<File> images,
      [String nameRequest = "files"]) async {
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);

    // Ensure the headers are set correctly if required
    request.headers.addAll(_myheaders);

    for (var image in images) {
      var multipartFile =
          await http.MultipartFile.fromPath(nameRequest, image.path);
      request.files.add(multipartFile);
    }

    request.fields.addAll(data);

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(jsonDecode(response.body));
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "files";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImages(
      String url, Map<String, String> data,
      {File? imageVichele,
      File? imageDelivaryId,
      File? imageDrivingLicense,
      String? namerequestVichele,
      String? namerequestDelivaryId,
      String? namerequestDrivingLicense}) async {
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    // Add vehicle image
    if (imageVichele != null) {
      await _addImageToRequest(
          request, imageVichele, namerequestVichele ?? "imageVichele");
    }

    // Add delivery ID image
    if (imageDelivaryId != null) {
      await _addImageToRequest(
          request, imageDelivaryId, namerequestDelivaryId ?? "imageDelivaryId");
    }

    // Add driving license image
    if (imageDrivingLicense != null) {
      await _addImageToRequest(request, imageDrivingLicense,
          namerequestDrivingLicense ?? "imageDrivingLicense");
    }

    // Add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    // Send Request
    var myrequest = await request.send();

    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<void> _addImageToRequest(
      http.MultipartRequest request, File image, String namerequest) async {
    var length = await image.length();
    var stream = http.ByteStream(image.openRead());
    stream.cast();
    var multipartFile = http.MultipartFile(
      namerequest,
      stream,
      length,
      filename: basename(image.path),
    );
    request.files.add(multipartFile);
  }

  Future<Either<StatusRequest, Map>> addRequestWithMultipleImages(
      String url, Map data, List<File> images,
      [String namerequest = "files"]) async {
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    // Iterate over the list of images and add each as a MultipartFile
    for (File image in images) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead())..cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // Add data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    // Send request
    var myrequest = await request.send();
    // Get response body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithMultipleImagesNew(
      String url, Map data, List<File> images,
      [String namerequest = "files"]) async {
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    for (var image in images) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
}

class CrudMix {
  late http.Response response; // late initialization

  Future<Either<StatusRequest, Map>> request(
      String linkurl, Map data, HttpMethod method) async {
    try {
      if (await checkInternet()) {
        if (method == HttpMethod.get) {
          response = await http.get(Uri.parse(linkurl));
        } else if (method == HttpMethod.post) {
          response = await http.post(Uri.parse(linkurl), body: data);
        }

        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          debugPrint(responseBody.toString());
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}

enum HttpMethod { get, post }
