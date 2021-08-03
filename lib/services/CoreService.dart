import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ibs/services/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'AppException.dart';

class CoreService {
  Future apiService(
      {GlobalKey key,
      header,
      body,
      bool multiPart = false,
      params,
      METHOD method,
      baseURL = baseUrl,
      endpoint,
      fileName,
      String filePath}) async {
    var param;
    if (multiPart) {
      param = {
        'uploadType': params.toString(),
      };
    } else {
      param = params;
    }
    var uri;
    print(endpoint);
    if (params != null) {
      //String queryString = Uri(queryParameters: params).query;
      uri = Uri.https(Uri.encodeFull(baseURL), Uri.encodeFull(endpoint), param);

      // Uri.http(Uri.encodeFull(baseURL), Uri.encodeFull(endpoint+'?'+queryString),);
    } else {
      uri = Uri.https(Uri.encodeFull(baseURL), Uri.encodeFull(endpoint));
    }
    print(endpoint);

    Map<String, String> requestHeaders = method == METHOD.MULTIPART
        ? {
            'Content-type': 'multipart/form-data',
          }
        : {
            //  'Content-type': 'application/json',
            // 'Accept': 'application/json',
          };
    if (header != null) {
      requestHeaders.addAll(header);
    }
    if (body != null) {
      body = body;
    }
    print("Header :  $requestHeaders");
    print("Body :  $body");
    print("Params :  $params");
    print("URL :  $uri");
    print("Method :  $method");

    switch (method) {
      case METHOD.GET:
        {
          var responseJson;
          try {
            final response = await http.get(uri, headers: requestHeaders);
            responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } catch (error) {
            Get.back();
          }
          return responseJson;
        }
        break;
      case METHOD.PUT:
        {
          var responseJson;

          try {
            final response =
                await http.put(uri, headers: requestHeaders, body: body);
            responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } catch (error) {}
          return responseJson;
        }
        break;
      case METHOD.DELETE:
        {
          var responseJson;

          try {
            final response = await http.delete(uri, headers: requestHeaders);
            responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } catch (error) {}
          return responseJson;
        }
        break;
      case METHOD.PATCH:
        {
          var responseJson;
          Get.dialog(Center(child: CircularProgressIndicator()),
              barrierDismissible: false);

          try {
            final response =
                await http.patch(uri, headers: requestHeaders, body: body);
            responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } catch (error) {}
          return responseJson;
        }
        break;
      case METHOD.POST:
        {
          var responseJson;
          try {
            print("body: $body");
            final response =
                await http.post(uri, headers: requestHeaders, body: body);
            print(response.body);
            responseJson = _returnResponse(response);
          } on SocketException {
            print("Socket");
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on Exception {
            //  Get.back();

            print("Exception block : ");
            throw UnknownException("Internal Server error");
          } catch (error) {
            print("Catch block:  $error");
          }
          return responseJson;
        }
        break;
      //   case METHOD.MULTIPART:
      //     {
      //       var responseJson;
      // //      Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
      //       try {
      //         var request = http.MultipartRequest(
      //           'POST',
      //           uri,
      //         );
      //         if (header != null) {
      //           request.headers.addAll(header);
      //         }
      //         print(filePath);
      //         final mimeTypeData =
      //         lookupMimeType(filePath, headerBytes: [0xFF, 0xD8]).split('/');

      //         request.files.add(await http.MultipartFile.fromPath(
      //             fileName, filePath,
      //             contentType: MediaType(mimeTypeData[0], mimeTypeData[1])));
      //         if(body!=null) {

      //           request.fields.addAll(body);
      //         }
      //         print("Request : $request");
      //         final http.StreamedResponse response = await request.send();
      //         print(response.reasonPhrase);
      //         responseJson = await http.Response.fromStream(response);
      //         responseJson = _returnResponse(responseJson);

      //       } on SocketException {
      //         Future.delayed(const Duration(seconds: 2), () async{
      //           print("delay");
      //            Get.snackbar("Sorry","No internet connection available!");
      //         });
      //       } catch (error) {
      //         print(error);
      //       }
      //       return responseJson;
      //     }
      //     break;
      default:
        {
          var responseJson;
          try {
            final response =
                await http.post(uri, headers: requestHeaders, body: body);
            responseJson = _returnResponse(response);
          } on SocketException {} catch (error) {}
          return responseJson;
        }
        break;
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print("Result : $responseJson");
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 422:
        var responseJson = json.decode(response.body.toString());
        print("Result : $responseJson");
        return responseJson;
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

enum METHOD { GET, PUT, POST, DELETE, PATCH, MULTIPART, GETPARAMS }
