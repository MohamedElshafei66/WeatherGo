import 'package:flutter/material.dart';
import '../helper/shared_pref.dart';

class UserProvider extends ChangeNotifier {
  String? _username;
  String? get username => _username;

  Future<void> loadUsername() async {
    _username = await SharedPrefsHelper.getUsername();
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  Future<void> logout() async {
    await SharedPrefsHelper.clearUserData();
    _username = null;
    notifyListeners();
  }
}
