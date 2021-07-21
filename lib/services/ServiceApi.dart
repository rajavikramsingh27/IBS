import 'package:flutter_ibs/services/url.dart';

class ServiceApi {
  static var server = baseUrl;

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
