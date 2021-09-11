

import 'package:flutter_ibs/models/BowelMovementsModel/BowelMovementsResponseModel.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessResponseModel.dart';
import 'package:flutter_ibs/models/Symptoms/SymptomsResponseModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/journal/JournalResponseModel.dart';
import 'package:flutter_ibs/models/language/LanguageResponseModel.dart';
import 'package:flutter_ibs/models/login/LoginResponseModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/medication/MedicationResponseModel.dart';
import 'package:flutter_ibs/models/signup/SignupResponseModel.dart';
import 'package:flutter_ibs/models/tags/TagsResponseModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
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
        .apiService(method: METHOD.FIND, endpoint: TRACK_LIST);
    return TrackablesListModel.fromJson(result);
  }

  Future<dynamic> signInApi({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.AUTHENTICATE, data: bodyData);
    // if (result.name.toString().toLowerCase() == "Unprocessable".toLowerCase()) {
    //   return SignupErrorModel.fromJson(result);
    // } else
    if (result == null) {
      return null;
    } else {
      return LoginResponseModel.fromJson(result);
    }
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
    if (result == null) {
      return null;
    } else
      return FoodResponseModel.fromJson(result);
  }

  Future<dynamic> getFoodList() async {
    var result =
        await CoreService().apiService(method: METHOD.FIND, endpoint: FOODS);
    if (result == null) {
      return null;
    } else
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
        method: METHOD.CREATE, endpoint: BOWEL_MOVEMENTS, data: bodyData);
    if (result == null) {
      return null;
    } else {
      return BowelMovementsResponseModel.fromJson(result);
    }
  }

  Future<dynamic> postJournalAPI({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: JOURNAL, data: bodyData);
    if (result == null) {
      return null;
    } else
      return JournalResponseModel.fromJson(result);
  }

  Future<dynamic> getMedicationList() async {
    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: MEDICATIONS);
    if (result == null) {
      return null;
    } else
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

  Future<dynamic> getUserHistoryList() async {
    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: TRACK_HISTORY);

    if (result == null) {
      return null;
    } else {
      var res = TrackHistoryResponseModelList.fromJson(result);
      return res.trackHistoryList;
    }
  }

  Future<dynamic> getUserList() async {
    final result = await CoreService().apiService(
        method: METHOD.FIND, endpoint: USERS);

    print('resultresultresultresultresultresult');
    print(result);

    if (result == null) {
      return null;
    } else {

    }
  }

  Future<dynamic> getFoodHistoryList({String id}) async {
    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: "$FOODS/$id");
    if (result == null) {
      return null;
    } else
      return TrackablesListModel.fromJson(result);
  }

  Future<dynamic> postHealthWellnessAPI({Map bodyData}) async {
    var result = await CoreService().apiService(method: METHOD.CREATE, endpoint: HEALTH_WELLNESS, data: bodyData);

    return HealthWellnessResponseModel.fromJson(result);
    }

  Future<LanguageResponseModel> getLanguage() async {
    var result =
        await CoreService().apiService(method: METHOD.FIND, endpoint: LANG);
    if (result == null) {
      return null;
    } else
      return LanguageResponseModel.fromJson(result);
  }

  Future<TagsResponseModel> postTags() async {
    var result =
        await CoreService().apiService(method: METHOD.CREATE, endpoint: TAGS);
    if (result == null) {
      return null;
    } else
      return TagsResponseModel.fromJson(result);
  }

  Future<TreatmentPlanResponseModel> getTreatmentPlan() async {
    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: TREATMENT_PLAN);
    if (result == null) {
      return null;
    } else
      return TreatmentPlanResponseModel.fromJson(result);
  }

}
