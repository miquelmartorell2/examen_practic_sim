import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
static late SharedPreferences _prefs;

static String _username = '';
static String _password = '';
static bool _rememberMe = false;


static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get username{
    return _prefs.getString('nom') ?? _username;
  }

  static set username(String value){
    _username = value;
    _prefs.setString('username', value);
  }

  static String get password{
    return _prefs.getString('password') ?? _password;
  }

  static set password(String value){
    _password = value;
    _prefs.setString('password', value);
  }

  static bool get rememberMe{
    return _prefs.getBool('rememberMe') ?? _rememberMe;
  }

  static set rememberMe(bool value){
    _rememberMe = value;
    _prefs.setBool('rememberMe', value);
  }

  


  //S'utilitza per borrar el contingut de sharedpreferences
  static Future<void> clear() async {
    await _prefs.clear();
  }
}