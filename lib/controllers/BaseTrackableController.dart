
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/track_history/TrackHistoryResponseModel.dart';
import 'package:get/get.dart';

class BaseTrackableController extends GetxController {
  RxBool loader = false.obs;

  TrackablesController trackablesController = Get.find();
  RxList<TrackableItem> formWidgetList = RxList();



  void onCancel() {
    Get.back();
  }

  void onSave(){

  }


  void setSavedData({TrackHistoryResponseModel pageData}){

    if (pageData != null){
      print("Setting saved data");
      formWidgetList.forEach((item) {
        setPreviousValue(item, pageData);
      });
    }

    // Refresh the local list so the form can generate:
    formWidgetList.refresh();
  }



  // Sets the value of each trackable to the stored history
  void setPreviousValue(TrackableItem item, TrackHistoryResponseModel pageData){
    int num = pageData.items.length;
    for (var i=0;i<num;i++){
      if (pageData.items[0].tid == item.tid){
        switch(item.kind){
          case 'rating':
            item.rating.value = pageData.items[0].value.number;
            break;
        }
        break;
      }
    }
  }

}
