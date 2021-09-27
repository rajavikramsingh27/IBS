import 'package:flutter_ibs/controllers/MyAccount/MyAccountController.dart';
import 'package:flutter_ibs/models/BowelMovementsModel/BowelMovementsResponseModel.dart';
import 'package:flutter_ibs/models/HealthWellnessModel/HealthWellnessResponseModel.dart';
import 'package:flutter_ibs/models/MyAccount/MyAccount.dart';
import 'package:flutter_ibs/models/Symptoms/SymptomsResponseModel.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/models/food/FoodResponseModel.dart';
import 'package:flutter_ibs/models/journal/JournalResponseModel.dart';
import 'package:flutter_ibs/models/language/LanguageResponseModel.dart';
import 'package:flutter_ibs/models/medication/MedicationResponseModel.dart';
import 'package:flutter_ibs/models/signup/SignupResponseModel.dart';
import 'package:flutter_ibs/models/tags/TagsResponseModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:flutter_ibs/models/user/UserModel.dart';
import 'package:flutter_ibs/services/CoreService.dart';
import 'package:flutter_ibs/services/url.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ServiceApi {
  Future<dynamic> signupApi({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: SIGNUP, data: bodyData);
    if (result != null) {
      return SignupResponseModel.fromJson(result);
    }
  }

  Future<Map<String, dynamic>> getTrackables() async {
    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: TRACK_LIST);

    return result;// TrackablesListModel.fromJson(result);
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
      return UserModel.fromJson(result);
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


  Future<dynamic> foodUpdateApi({String id, Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.UPDATE, endpoint: FOODS, data: bodyData, objectId: id);
    if(result != null) {
      return FoodResponseModel.fromJson(result);
    }
  }


  Future<dynamic> foodTrackApi({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: FOODS, data: bodyData);
   if(result != null) {
     return FoodResponseModel.fromJson(result);
   }
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

    if (result != null) {
      return SymptomsResponseModel.fromJson(result);
    }
  }

  Future<dynamic> updateSymptomsAPI({String id, Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.UPDATE, endpoint: SYMPTOMS,
        objectId: id,
        data: bodyData);

    if (result != null) {
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

  Future<dynamic> updateBowelMovementAPI({String id, Map bodyData}) async {
    var result = await CoreService().apiService(
        method: METHOD.UPDATE, endpoint: BOWEL_MOVEMENTS, data: bodyData, objectId: id);
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


  Future<dynamic> updateMedicationAPI({String id, Map bodyData}) async {
    var result = await CoreService().apiService(
        method: METHOD.UPDATE, endpoint: MEDICATIONS, data: bodyData, objectId: id);
    if (result != null) {
      return MedicationResponseModel.fromJson(result);
    }
  }

  Future<dynamic> postMedicationAPI({Map bodyData}) async {
    var result = await CoreService().apiService(
        method: METHOD.CREATE, endpoint: MEDICATIONS, data: bodyData);
    if (result != null) {
      return MedicationResponseModel.fromJson(result);
    }
  }

  Future<dynamic> getUserHistoryList(DateTime setTime) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
    var startDate = formatter.format(setTime.subtract(Duration(days:1)) );
    var endDate = formatter.format(setTime.add(Duration(days:1, hours: 12)) );

    Map<String, dynamic> params = {
      'startDate': startDate,
      'endDate': endDate
    };

    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: TRACK_HISTORY, data: params);

    if (result == null) {
      return null;
    } else {
      var res = TrackHistoryResponseModelList.fromJson(result);
      return res.trackHistoryList;
    }
  }

  Future<dynamic> getUserList() async {
    final result = await CoreService()
        .apiService(method: METHOD.GET, endpoint: USERS, data: "me");

    print('resultresultresultresultresultresult');
    print(result);

    if (result == null) {
      return null;
    } else {}
  }

  Future<dynamic> getFoodHistoryList({String id}) async {
    var result = await CoreService()
        .apiService(method: METHOD.FIND, endpoint: "$FOODS/$id");
    if (result == null) {
      return null;
    } else
      return TrackablesListModel.fromJson(result);
  }

  Future<dynamic> updateHealthWellnessAPI({String id, Map bodyData}) async {
    var result = await CoreService().apiService(
        method: METHOD.UPDATE, endpoint: HEALTH_WELLNESS, data: bodyData, objectId: id);
    if(result != null) {
      return HealthWellnessResponseModel.fromJson(result);
    }
  }

  Future<dynamic> postHealthWellnessAPI({Map bodyData}) async {
    var result = await CoreService().apiService(
        method: METHOD.CREATE, endpoint: HEALTH_WELLNESS, data: bodyData);

    if(result != null) {
      return HealthWellnessResponseModel.fromJson(result);
    }
  }

  Future<LanguageResponseModel> getLanguage() async {
    var result =
        await CoreService().apiService(method: METHOD.FIND, endpoint: LANG);
    if (result == null) {
      return null;
    } else
      return LanguageResponseModel.fromJson(result);
  }

  Future<UserModel> createUserTag({Map tagData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: TAGS, data: tagData);
    if (result == null) {
      return null;
    } else
      return UserModel.fromJson(result);
  }

  Future<TagsResponseModel> postTags({Map bodyData}) async {
    var result = await CoreService()
        .apiService(method: METHOD.CREATE, endpoint: TAGS, data: bodyData);
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

  Future<dynamic> postTreatmentPlanAPI({Map bodyData}) async {
    var result = await CoreService().apiService(
        method: METHOD.CREATE, endpoint: POST_TREATMENT_PLAN, data: bodyData);

    if (result == null) {
      return null;
    } else {
      return UserModel.fromJson(result);
    }
  }

  Future<dynamic> removeTreatmentPlan(String objectId) async {
    var result = await CoreService().apiService(
        method: METHOD.DELETE,
        endpoint: "$POST_TREATMENT_PLAN/$objectId",
        objectId: objectId);
    print("Result: $result");
    if (result == null) {
      return null;
    } else {
      return UserModel.fromJson(result);
    }
  }

  Future<dynamic> updateUser({Map bodyData}) async {
    final MyAccountController _controller = Get.put(MyAccountController());

    Map<String, dynamic> data = {
      'profile': bodyData,
      'label': _controller.emailController.text
    };

    final result = await CoreService().apiService(
      method: METHOD.PATCH,
      endpoint: USERS,
      data: data,
    );

    //     .catchError((error) {
    //   print(error.message.toString());
    //   Get.snackbar("Sorry", error.message.toString());
    // }).then((value)  {
    //   Get.snackbar("Success!", "Profile updated.");
    // });

    return MyAccountModel.fromJson(result);
  }

  Future<dynamic> updateIBS_RomeIV({Map bodyData}) async {
    final data = {
      'profile': bodyData,
    };
    print(data);

    final result = await CoreService().apiService(
      method: METHOD.PATCH,
      endpoint: USERS,
      data: data,
    );

    return MyAccountModel.fromJson(result);
  }

  Future<dynamic> updateTrackingOption({Map bodyData}) async {
    final result = await CoreService().apiService(
      method: METHOD.UPDATE,
      endpoint: TRACK_UPDATE,
      data: bodyData,
    );

    return MyAccountModel.fromJson(result);
  }
}
