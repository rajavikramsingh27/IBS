

import 'package:flutter_ibs/controllers/MyAccount/MyAccountController.dart';
import 'package:flutter_ibs/models/BowelMovementsModel/BowelMovementsResponseModel.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessResponseModel.dart';
import 'package:flutter_ibs/models/MyAccount/MyAccount.dart';
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

import 'package:get/get.dart';


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

  Future<dynamic> getUserList() async {
    final result = await CoreService().apiService(method: METHOD.GET, endpoint: USERS)
        .catchError((error) {
      print(error.message.toString());
    });

    if (result == null) {
      return null;
    } else {
      return MyAccountModel.fromJson(result);
    }

  }

  Future<dynamic> updateUser({Map bodyData}) async {
    final  MyAccountController _controller = Get.put(MyAccountController());

    // Map<String, dynamic> data = {
    //   'profile':bodyData,
    //   'label' : _controller.emailController.text
    // };


    Map<String, dynamic> data = {
      "profile": {
        "sex": "f",
        "age": "30-39",
        "familyHistory": "yes",
        "diagnosedIbs": {
          "isDiagnosed": true,
          "ibsType": "c"
        }
      }
    };

    print(data);

    final result = await CoreService().apiService(
        method: METHOD.PATCH,
        endpoint: USERS,
      // objectId: '4d41ab9a695021519bccee17cf3cba5dcc1902d8',
      data: data,
    )  .catchError((error) {
      print(error.message.toString());
      Get.snackbar("Sorry", error.message.toString());
    }).then((value)  {
      Get.snackbar("Success!", "Profile updated.");
    });

    return MyAccountModel.fromJson(result);
  }

  Future<dynamic> updateIBS({Map bodyData}) async {

    final data = {'profile':bodyData,};
    print(data);
    final result = await CoreService().apiService(
      method: METHOD.PATCH,
      endpoint: USERS,
      data: data,
    )  .catchError((error) {
      print(error.message.toString());
      Get.snackbar("Sorry", error.message.toString());
    }).then((value)  {
      Get.snackbar("Success!", "IBS Diagnosis updated.");
    });

    return MyAccountModel.fromJson(result);
  }

}


