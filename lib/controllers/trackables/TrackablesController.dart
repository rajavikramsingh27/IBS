
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/services/ServiceApi.dart';
import 'package:flutter_ibs/utils/ConnectionCheck.dart';
import 'package:get/get.dart';

class TrackablesController extends GetxController {
  RxBool connectionStatus = false.obs;
  RxBool loader = false.obs;

  Rx<TrackablesListModel> trackList = TrackablesListModel().obs;
  //List<TrackablesListModel> _sourceTrackList = TrackablesListModel();

  Rx<TrackableItem> symptoms = TrackableItem().obs;
  Rx<TrackableItem> bowelMovements = TrackableItem().obs;
  Rx<TrackableItem> food = TrackableItem().obs;
  Rx<TrackableItem> journal = TrackableItem().obs;
  Rx<TrackableItem> medications = TrackableItem().obs;
  Rx<TrackableItem> healthWellness = TrackableItem().obs;

  bool _init = false;

  @override
  void onInit() async {
    super.onInit();
    _getTrackList();
  }



  _getTrackList() async {
    if (_init) {
      return;
    }
    bool isInternet = await ConnectionCheck().initConnectivity();
    connectionStatus.value = isInternet;

    if (connectionStatus.value) {
      loader.value = true;
      await ServiceApi().getTrackables().then((value) {
        // Sort the list bw "weight" property ascending:
        value.data.sort((a, b) {
          return a.weight.compareTo(b.weight);
        });

        trackList.value = value;
      });

      _setCategories();

      loader.value = false;
      _init = true;
    }
  }


  _setCategories(){
    trackList.value.data.forEach((element) {
      switch (element.tid){
        case "symptoms":
          symptoms.value = element;
          break;
        case "bowelMovements":
          bowelMovements.value = element;
          break;
        case "food":
          food.value = element;
          break;
        case "journal":
          journal.value = element;
          break;
        case "medications":
          medications.value = element;
          break;
        case "healthWellness":
          healthWellness.value = element;
          break;
      }
    });
  }


}
