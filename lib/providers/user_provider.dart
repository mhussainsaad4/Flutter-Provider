import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider();

  String _userName = 'ProviderValue';

  String get userName {
    return _userName;
  }

  void updateUserName({required String userName}) async {
    _userName = userName;
    notifyListeners();

  }
}
