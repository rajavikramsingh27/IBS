
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
      default:
        throw new Exception("doesUserTrack called on unknown category " + item.tid + ", "+  item.category);
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