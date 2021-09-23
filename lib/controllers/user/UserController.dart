
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/user/UserModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() async {
    super.onInit();

  }

  setUser(UserModel usr){
    user.value = usr;
  }


  /// Does a user track a particular trackable?
  bool doesUserTrack(TrackableItem item){
    if (user.value == null){
      print("** User is null in doesUserTrack $item.tid");
      return true;
    }
    switch (item.category){
      case "symptoms":
        return _testIsTracking(item, user.value.tracking.symptoms);
      case "bowelMovements":
        return _testIsTracking(item, user.value.tracking.bowelMovements);
      case "medications":
        return _testIsTracking(item, user.value.tracking.medications);
      case "healthWellness":
        return _testIsTracking(item, user.value.tracking.healthWellness);
      case "food":
        return _testIsTracking(item, user.value.tracking.foods);
      case "journal":
        return _testIsTracking(item, user.value.tracking.journal);
      default:
        throw new Exception("doesUserTrack called on unknown category " + item.tid + ", "+  item.category);
    }
  }

  bool doesUserTrackCategory(String category){
    if (user.value == null){
      print("** User is null in doesUserTrackCategory $category");
      return true;
    }
    switch (category){
      case "symptoms":
        return user.value.tracking.symptoms.length > 0;
      case "bowelMovements":
        return user.value.tracking.bowelMovements.length > 0;
      case "medications":
        return  user.value.tracking.medications.length > 0;
      case "healthWellness":
        return user.value.tracking.healthWellness.length > 0;
      case "food":
        return user.value.tracking.foods.length > 0;
      case "journal":
        return user.value.tracking.journal.length > 0;
      default:
        throw new Exception("doesUserTrack called on unknown category $category");
    }
  }


   addTagToUser(Tag tag) async {
    this.user.value = await ServiceApi().createUserTag(tagData: tag.toJson());
    this.user.refresh();
  }



  /// Check to see if the list contains the item in question
  bool _testIsTracking(TrackableItem item, List<UserTrackable> list ){
    int num = list.length;
    bool found = false;

    for (int i=0;i<num;i++) {
      if (list[i].tid == item.tid) {
        found = true;
        break;
      }
    }

    return found;
  }


}
