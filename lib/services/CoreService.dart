import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:flutter_ibs/routes/RouteConstants.dart';
import 'package:flutter_ibs/services/url.dart';
import 'package:flutter_ibs/utils/SnackBar.dart';
import 'package:get/get.dart';

class CoreService {
  static final CoreService _default = new CoreService._internal();
  static FlutterFeathersjs flutterFeathersjs = FlutterFeathersjs()
    ..init(baseUrl: BASE_URL);

  factory CoreService() {
    return _default;
  }

  CoreService._internal();

  static getInstance() {
    return _default;
  }

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
          try {
            final response = await flutterFeathersjs.get(
                serviceName: endpoint, objectId: objectId);

            return response;
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            print("CatchError: $e");
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
            if (e.type == FeatherJsErrorType.IS_NOT_AUTHENTICATED_ERROR) {
              Get.offAllNamed(signIn);
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            }
          } catch (er) {
            // Catch  unknown error
            print(er);
          }
        }
        break;

      case METHOD.CREATE:
        {
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

            if (e.type == FeatherJsErrorType.IS_NOT_AUTHENTICATED_ERROR) {
              Get.offAllNamed(signIn);
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
            print(er);
          }
        }
        break;
      case METHOD.MULTIPART:
        {
          //      Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
          try {
            var response = await flutterFeathersjs.create(
              serviceName: "message",
              data: data,
            );
            return response;
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            print("CatchError: $e");
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
            if (e.type == FeatherJsErrorType.IS_NOT_AUTHENTICATED_ERROR) {
              Get.offAllNamed(signIn);
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            }
          } catch (er) {
            // Catch  unknown error
            print(er.errorMessage());
          }
        }
        break;
      case METHOD.UPDATE:
        {
          try {
            final response = await flutterFeathersjs.update(
                objectId: objectId, serviceName: endpoint, data: data);
            return response;
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            print("CatchError: $e");
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
            if (e.type == FeatherJsErrorType.IS_NOT_AUTHENTICATED_ERROR) {
              Get.offAllNamed(signIn);
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            }
          } catch (er) {
            // Catch  unknown error
            print(er);
          }
        }
        break;
      case METHOD.DELETE:
        {
          try {
            final response = await flutterFeathersjs.remove(
                serviceName: endpoint, objectId: objectId);
            return response;
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            print("CatchError: $e");
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
            if (e.type == FeatherJsErrorType.IS_NOT_AUTHENTICATED_ERROR) {
              Get.offAllNamed(signIn);
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            }
          } catch (er) {
            // Catch  unknown error
            print(er.errorMessage());
          }
        }
        break;
      case METHOD.FIND:
        {
          try {
            final response = await flutterFeathersjs.find(
                serviceName: endpoint, query: data);
            return response;
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            print("res: $e");

            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
            if (e.type == FeatherJsErrorType.IS_NOT_AUTHENTICATED_ERROR) {
              Get.offAllNamed(signIn);
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            }
          } catch (er) {
            // Catch  unknown error
            print(er);
          }
        }
        break;
      case METHOD.PATCH:
        {
          // Get.dialog(Center(child: CircularProgressIndicator()),
          //     barrierDismissible: false);

          try {
            final response = await flutterFeathersjs.patch(
                objectId: objectId, serviceName: endpoint, data: data);
            return response;
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            print("CatchError: $e");
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
            if (e.type == FeatherJsErrorType.IS_NOT_AUTHENTICATED_ERROR) {
              Get.offAllNamed(signIn);
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            }
          } catch (er) {
            // Catch  unknown error

            print(er.message.toString());
          }
        }
        break;
      case METHOD.AUTHENTICATE:
        {
          try {
            print("Data: $data");
            final response = await flutterFeathersjs.authenticate(
              strategy: data["strategy"],
              password: data["password"],
              userName: data["loginId"],
              userNameFieldName: "loginId",
            );

            debugPrint("Response: $response", wrapWidth: 1024);

            return response;
          } on SocketException {
            Future.delayed(const Duration(seconds: 2), () async {
              print("delay");
              Get.snackbar("Sorry", "No internet connection available!");
            });
          } on FeatherJsError catch (e) {
            print("CatchError: $e");
            // When error is FeatherJsErrorType
            // if(e.type == FeatherJsErrorType.IS_SERVER_ERROR)
            // Check the error type as above and handle it
            if (e.type == FeatherJsErrorType.IS_NOT_AUTHENTICATED_ERROR) {
              Get.offAllNamed(signIn);
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            } else {
              CustomSnackBar()
                  .errorSnackBar(title: "Error", message: e.message);
            }
          } catch (er) {
            // Catch  unknown error
            print(er.errorMessage());
          }
        }
        break;
      case METHOD.REAUTHENTICATE:
        {
          try {
            bool isReAuthenticated = await flutterFeathersjs.reAuthenticate();

            //print(isReAuthenticated); => true

            return isReAuthenticated;
          } on FeatherJsError catch (e) {
            if (e.type == FeatherJsErrorType.IS_AUTH_FAILED_ERROR) {
              //TODO: ReAutentication failed
              // Redirect user to login page
            } else {
              //TODO: Check for other FeatherJsErrorType
              // why => print(e.type);
              // why => print(e.message);
            }
          } catch (e) {
            //TODO: Authentication failed for unkknown reason.
            // why => print(e.type);
            // why => print(e.message);
          }
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
//
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
  POST,
  AUTHENTICATE,
  REAUTHENTICATE
}
