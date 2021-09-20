import 'package:flutter_ibs/controllers/user/UserController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:get/instance_manager.dart';

/// Provides a series of utilities for handling / parsing Trackable Item objects
class TrackableItemUtils {
  UserController _userController = Get.find();

  getItemValue(TrackableItem item){
    switch (item.kind){
      case "rating":
        return item.rating.value;
        break;
      case "list":
        return item.list.value;
      default:
        print ("**** TrackableItemUtils.getItemValue called for unknown type " + item.tid + ", " + item.kind);
    }
  }


  List<Tag> addUserTagsToList({
    List<Tag> tags,
  }){
    List<Tag> userTags;
    String category = tags[0].category;

    switch (category){
      case "breakfast":
        userTags = _userController.user.value.tags.breakfast;
        break;
      case "lunch":
        userTags = _userController.user.value.tags.lunch;
        break;
      case "dinner":
        userTags = _userController.user.value.tags.dinner;
        break;
      case "snacks":
        userTags = _userController.user.value.tags.snacks;
        break;
      case "relaxationTechniques":
        userTags = _userController.user.value.tags.relaxationTechniques;
        break;
      case "medicationsPrescription":
        userTags = _userController.user.value.tags.medicationsPrescription;
        break;
      case "medicationsOther":
        userTags = _userController.user.value.tags.medicationsOther;
        break;
    }

    return ([...userTags, ...tags]);
  }

}
