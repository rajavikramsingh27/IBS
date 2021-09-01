import 'package:flutter_ibs/models/BowelMovementsModel/BowelMovementsResponseModel.dart';
import 'package:flutter_ibs/models/Symptoms/SymptomsResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/journal/JournalResponseModel.dart';
import 'package:flutter_ibs/models/login/LoginResponseModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/medication/MedicationResponseModel.dart';
import 'package:flutter_ibs/models/signup/SignupResponseModel.dart';
import 'package:flutter_ibs/services/CoreService.dart';
import 'package:flutter_ibs/services/url.dart';

class ServiceApi {
  Future<dynamic> signupApi({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: SIGNUP, data: bodyData);

    return SignupResponseModel.fromJson(result);
  }

  Future<TrackablesListModel> getTrackables() async {
    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: TRACKLIST);
    print("result: $result");
    return TrackablesListModel.fromJson(result);
  }

  Future<dynamic> signInApi({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.AUTHENTICATE, data: bodyData);
    // if (result.name.toString().toLowerCase() == "Unprocessable".toLowerCase()) {
    //   return SignupErrorModel.fromJson(result);
    // } else
    return LoginResponseModel.fromJson(result);
  }

  Future<dynamic> getSymptomsApi({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: SYMPTOMS, data: bodyData);
    if (result == null) {
      return null;
    } else {
      return SymptomsResponseModel.fromJson(result);
    }
  }

  Future<dynamic> getReAuthApi() async {
    var result = await CoreService().apiService(
      method: METHOD.REAUTHENTICATE,
    );

    return result;
  }

  Future<dynamic> foodTrackApi({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: FOODS, data: bodyData);

    return FoodResponseModel.fromJson(result);
  }

  Future<dynamic> getFoodList() async {
    var result =
        await CoreService().apiService(method: METHOD.FIND, endpoint: FOODS);
    return result;
  }

  Future<dynamic> postSymptomsAPI({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: SYMPTOMS, data: bodyData);

    if (result == null) {
      return null;
    } else {
      return SymptomsResponseModel.fromJson(result);
    }
  }

  Future<dynamic> postBowelMovementAPI({Map bodyData}) async {
    var result = await CoreService().apiService(
        method: METHOD.CREATE, endpoint: BOWELMOVEMENTS, data: bodyData);
    if (result == null) {
      return null;
    } else {
      return BowelMovementsResponseModel.fromJson(result);
    }
  }

  Future<dynamic> postJournalAPI({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: JOURNAL, data: bodyData);

    return JournalResponseModel.fromJson(result);
  }

  Future<dynamic> getMedicationList() async {
    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: MEDICATIONS);
    return result;
  }

  Future<dynamic> postMedicationAPI({Map bodyData}) async {
    var result = await CoreService().apiService(
        method: METHOD.CREATE, endpoint: MEDICATIONS, data: bodyData);
    if (result == null) {
      return null;
    } else {
      return MedicationResponseModel.fromJson(result);
    }
  }
}
