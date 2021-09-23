import 'package:flutter/material.dart';

class ShareStore extends ScopeStorage {
  //Singleton Class
  static final ShareStore _default = new ShareStore._internal();

  factory ShareStore() {
    return _default;
  }

  ShareStore._internal();
}

enum KeyStore {
  userprofile,
}

class ScopeStorage {
  var scopeData = Map<KeyStore, Object>();

  void saveData({KeyStore store, Object object}) {
    scopeData[store] = object;
    debugPrint('Successfully saved');
  }

  void deleteData({KeyStore scope}) {
    scopeData.remove(scope);
    debugPrint('deleteData Success');
  }

  Object getData({KeyStore store}) {
    debugPrint("${scopeData[store]}");
    return scopeData[store];
  }

  void updateDataWhileNotPresent({KeyStore store, Object object}) {
    scopeData.putIfAbsent(store, () => object);
    debugPrint('updateDataWhileNotPresent Success');
  }

  void replaceData({KeyStore store, Object object}) {
    scopeData.update(store, (e) => object);
    debugPrint('replaceData Success');
  }

  void clear() {
    scopeData.clear();
    debugPrint('clear Success');
  }
}
