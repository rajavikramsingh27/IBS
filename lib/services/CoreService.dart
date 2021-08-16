import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:flutter_ibs/Store/HiveStore.dart';
import 'package:flutter_ibs/models/error_model/SignupErrorModel.dart';
import 'package:flutter_ibs/services/url.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class CoreService {
  static final CoreService _default = new CoreService._internal();

  factory CoreService() {
    return _default;
  }

  CoreService._internal();

  static getInstance() {
    return _default;
  }

  static FlutterFeathersjs flutterFeathersjs = FlutterFeathersjs()
    ..init(baseUrl: BASE_URL);
  Future apiService(
      {String endpoint,
      String objectId,
      data,
      baseURL = BASE_URL,
      fileName,
      method,
      password,
      username}) async {
    switch (method) {
      case METHOD.GET:
        {
          var responseJson;
          try {
            final response = await flutterFeathersjs.get(
                serviceName: endpoint, objectId: objectId);
            return response;
            print("res: $response");
            // responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
          } catch (er) {
            // Catch  unknown error

          }
          return responseJson;
        }
        break;

      case METHOD.CREATE:
        {
          var responseJson;
          try {
            final response = await flutterFeathersjs.create(
                serviceName: endpoint, data: data);

            return response;

            // responseJson = _returnResponse(response);
          } on SocketException {
            print("Socket");
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            print("$e");
            if (e.type == FeatherJsErrorType.IS_SERVER_ERROR) {
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            }
            if (e.type == FeatherJsErrorType.IS_CONFLICT_ERROR) {
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            }

            // SignupErrorModel errorMessage = SignupErrorModel.fromJson(e.error);
            // CustomSnackBar().errorSnackBar(title: "Error", message: e);

            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
          } catch (er) {
            // Catch  unknown error

          }
          return responseJson;
        }
        break;
      case METHOD.MULTIPART:
        {
          var responseJson;
          //      Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
          try {
            var response = await flutterFeathersjs.create(
              serviceName: "message",
              data: data,
            );
            return response;
            print("res: $response");
            // responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
          } catch (er) {
            // Catch  unknown error

          }
          return responseJson;
        }
        break;
      case METHOD.UPDATE:
        {
          var responseJson;

          try {
            final response = await flutterFeathersjs.update(
                objectId: objectId, serviceName: endpoint, data: data);
            return response;
            print("res: $response");

            // print(messageResponse); => feathers's get data format
            // responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
          } catch (er) {
            // Catch  unknown error

          }
          return responseJson;
        }
        break;
      case METHOD.DELETE:
        {
          var responseJson;

          try {
            final response = await flutterFeathersjs.remove(
                serviceName: endpoint, objectId: objectId);
            return response;
            print("res: $response");
            // responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
          } catch (er) {
            // Catch  unknown error

          }
          return responseJson;
        }
        break;
      case METHOD.FIND:
        {
          var responseJson;
          try {
            final response = await flutterFeathersjs.find(
                serviceName: endpoint, query: null);
            return response;
            print("res: $response");
            // responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
          } catch (er) {
            // Catch  unknown error

          }
          return responseJson;
        }
        break;
      case METHOD.PATCH:
        {
          var responseJson;

          Get.dialog(Center(child: CircularProgressIndicator()),
              barrierDismissible: false);

          try {
            final response = await flutterFeathersjs.patch(
                objectId: objectId, serviceName: endpoint, data: data);
            return response;
            print("res: $response");
            // print(messageResponse); => feathers's get data format
            // responseJson = _returnResponse(response);
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
          } catch (er) {
            // Catch  unknown error

          }
          return responseJson;
        }
        break;
      case METHOD.AUTHENTICATE:
        {
          var responseJson;
          print("pa: ${data["password"]}");
          print("pa: ${data["strategy"]}");
          print("pa: ${data["loginId"]}");

          // print("ids: ${data.loginId}");
          try {
            final response = await flutterFeathersjs.authenticate(
                strategy: data["strategy"],
                password: data["password"],
                userName: data["loginId"]);

            return response;
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
          } catch (er) {
            // Catch  unknown error

          }
          return responseJson;
        }
        break;
      default:
        break;
    }
  }

// dynamic _returnResponse(FlutterFeathersjs response) {
//   switch (response.dio.options.validateStatus(int)) {
//     case 200:
//       var responseJson = json.decode(response.body.toString());
//       print("Result : $responseJson");
//       return responseJson;
//     case 400:
//       throw BadRequestException(response.body.toString());
//     case 401:
//     case 403:
//       throw UnauthorisedException(response.body.toString());
//     case 500:
//     default:
//       throw FetchDataException(
//           'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
//   }
// }
}

enum METHOD {
  GET,
  CREATE,
  UPDATE,
  DELETE,
  PATCH,
  MULTIPART,
  FIND,
  AUTHENTICATE
}
