import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application/models/user.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  Future<String?> get authToken async {
    final SharedPreferences _sharedPreference =
        await SharedPreferences.getInstance();
    print("Start get auth token");
    return _sharedPreference.getString(Preferences.auth_token);
  }

  Future<bool> saveAuthToken(String authToken) async {
    final SharedPreferences _sharedPreference =
        await SharedPreferences.getInstance();
    print("Save token: " + authToken);
    var res =
        await _sharedPreference.setString(Preferences.auth_token, authToken);
    print(await this.authToken);
    return res;
  }

  Future saveUser(User user) async {
    final SharedPreferences _sharedPreference =
        await SharedPreferences.getInstance();
    List<Future<bool>> _saveUser = List<Future<bool>>.empty(growable: true);
    if (user.login != null) {
      _saveUser
          .add(_sharedPreference.setString(Preferences.login, user.login!));
      print("Save login");
    }

    _saveUser.add(
        _sharedPreference.setString(Preferences.firstName, user.firstName));
    print("Save first name");
    _saveUser
        .add(_sharedPreference.setString(Preferences.lastName, user.lastName));

    if (user.avatar != null) {
      _saveUser
          .add(_sharedPreference.setString(Preferences.avatar, user.avatar!));
    }

    _saveUser.add(_sharedPreference.setString(Preferences.phone, user.phone));

    _saveUser.add(_sharedPreference.setString(Preferences.email, user.email));

    _saveUser.add(_sharedPreference.setStringList(
        Preferences.authorities, user.authorities));

    await Future.wait(_saveUser);
    print(user.firstName);
    print(_sharedPreference.getString(Preferences.firstName));
    print(_sharedPreference.getString(Preferences.lastName));
  }

  Future<bool> removeAuthToken() async {
    final SharedPreferences _sharedPreference =
        await SharedPreferences.getInstance();
    return _sharedPreference.remove(Preferences.auth_token);
  }
}
