import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SpManager {
  late SharedPreferences sharedPreference;

  final String accessTokenKey = 'ACCESS_TOKEN';

  // Access Token Save
  saveAccessToken(String token) async {
    sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setString(accessTokenKey, token);
  }

  // Get Access Token
  Future<String> getAccessToken() async {
    sharedPreference = await SharedPreferences.getInstance();
    String? accessToken = sharedPreference.getString(accessTokenKey);
    return accessToken ?? '';
  }

  // Delete Access Token
  deleteAccessToken() async {
    await sharedPreference.remove(accessTokenKey);
  }
}
