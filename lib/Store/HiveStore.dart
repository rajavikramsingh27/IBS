import 'package:flutter_ibs/Store/vm.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Keys {
  static const String LOGINID = "LOGINID";
  static const String REMEMBER = "REMEMBER";
  static const String PHONE = "PHONE";
  static const String LOGEDIN = "LOGEDIN";
  static const String TOKEN = "TOKEN";
  static const String LOGINDATA = "loginData";
  static const String PROFILEIMAGE = "PROFILEIMAGE";
  static const String EMAIL = "EMAIL";
  static const String ISLOGIN = "ISLOGIN";
  static const String ISSOCIALLOGIN = "ISSOCIALLOGIN";
}

class HiveStore {
  //Singleton Class
  static final HiveStore _default = new HiveStore._internal();
  static Box defBox;

  factory HiveStore() {
    return _default;
  }

  HiveStore._internal();

  static getInstance() {
    return _default;
  }

  initBox() async {
    defBox = await (openBox());
  }

  //Object Storage
  put(String key, Object value) async {
    defBox.put(key, value);
    print("HiveStored : Key:$key, Value:$value");
  }

  get(String key) {
    print("Box is Open? ${defBox.isOpen}");
    print("HiveRetrive : Key:$key, Value:${defBox.get(key)}");
    return defBox.get(key);
  }

  clear() {
    defBox.clear();
  }

  delete(String key) async {
    defBox.delete(key);
  }

  Future openBox() async {
    if (!isBrowser) {
      var dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    }
    return await Hive.openBox('Store');
  }
}
