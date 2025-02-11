import 'package:flutter/material.dart';

import '../utils/resources/strings.dart';

class UserProvider extends ChangeNotifier {
  UserProvider();

  String _userName = Strings.initialValue;

  String get userName {
    return _userName;
  }

  void updateUserName({required String userName}) async {
    _userName = userName;
    notifyListeners();
  }
}
