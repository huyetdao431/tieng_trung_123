import 'package:hive_flutter/hive_flutter.dart';

class HiveRepository {
  var box = Hive.box('profile');

  void saveLoginInfo({required bool isRemember, required String email, required String password}) {
    box.put('isRemember', isRemember);
    box.put('email', email);
    box.put('password', password);
  }

  Map<String, dynamic> getLoginInfo() {
    if (box.get('isRemember') == true) {
      return {'email': box.get('email'), 'password': box.get('password'), 'isRemember': box.get('isRemember')};
    }
    return {};
  }

  void clear() {
    box.clear();
  }
}
