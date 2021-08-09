import 'package:flutter_ibs/models/error_model/SignupErrorModel.dart';
import 'package:flutter_ibs/models/response_model/SignupResponseModel.dart';
import 'package:flutter_ibs/models/response_model/TrackablesListModel.dart';
import 'package:flutter_ibs/services/CoreService.dart';
import 'package:flutter_ibs/services/url.dart';

class ServiceApi {
  Future<dynamic> signupApi(
      {Map<String, dynamic>? bodyData, Map? header}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: SIGNUP, data: bodyData);
    if (result.name.toString().toLowerCase() == "Unprocessable".toLowerCase()) {
      return SignupErrorModel.fromJson(result);
    } else
      return SignupResponseModel.fromJson(result);
  }

  Future<Trackables1Model> getTrackables() async {
    Trackables1Model model = Trackables1Model();
    var result = await CoreService().apiService(
        method: METHOD.GET, endpoint: TRACKLIST, objectId:  "610c57b689700681dab0b62f");

    return Trackables1Model.fromJson(result);
  }
//  Future<DummyDataModel> getData({Map query}) async {

//   // ChangePasswordDataModel model = ChangePasswordDataModel(
//   //   oldPassword:oldPassword,
//   //   newPassword: password.text,);
//   //HeaderModel headerModel= HeaderModel(authorization:await HiveStore().get(Keys.TOKEN).toString() );
//    final result= await CoreService().apiService(
//     //body: model.toJson(),
//     baseURL: baseUrl,
//     method: METHOD.GET,
//     params: query,
//     endpoint: "/api/users",
//   );
//   return  DummyDataModel.fromJson(result);
// }

// static Future<LoginResponseModel> signUpAPI({Map bodyData,Map header}) async {
//   String body = json.encode(bodyData);
//     var result = await CoreService().apiService(
//       body: body,
//       baseURL: baseUrl,
//       method: METHOD.POST,
//       header: header,
//       endpoint: login,
//     );
//      return LoginResponseModel.fromJson(result);
//   }
// Future<LoginResponseModel> loginApi({Map bodyData}) async {
//   var result = await CoreService().apiService(
//     body: bodyData,
//     baseURL: baseUrl,
//     method: METHOD.POST,
//     endpoint: login,
//   );

//     return LoginResponseModel.fromJson(result);
// }

}
