import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences { 
  static late SharedPreferences _preferences;
  static const _keyBackgroundColor = 'bgc';
  static const _keyFontMultiplier = 'multi';
  static Future init() async =>
    _preferences = await SharedPreferences.getInstance();

  static Future setFontMultiplier(double multiplier) async =>
    await _preferences.setDouble(_keyFontMultiplier, multiplier);
  static double? getFontMultiplier() => _preferences.getDouble(_keyFontMultiplier);

  // set background
  static Future setBackgroundColor(String backgroundValue) async => 
    await _preferences.setString(_keyBackgroundColor, backgroundValue);
  static String? getBackgroundColor() => _preferences.getString(_keyBackgroundColor);
}

