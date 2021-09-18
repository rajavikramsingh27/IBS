import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';

/// Provides a series of utilities for handling / parsing Trackable Item objects
class TrackableItemUtils {

  getItemValue(TrackableItem item){
    switch (item.kind){
      case "rating":
        return item.rating.value;
        break;
      default:
        print ("getItemValue called for unknown type " + item.tid + ", " + item.kind);
    }
  }


}
