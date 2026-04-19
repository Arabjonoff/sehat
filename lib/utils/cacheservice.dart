import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'cache_keys.dart';

class CacheService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> clear() => _prefs.clear();

  // ---------- Device ----------
  static void saveDeviceInfo(Map<String, dynamic> data) =>
      _prefs.setString(CacheKeys.deviceInfo, jsonEncode(data));

  static Map<String, dynamic>? getDeviceInfo() {
    final data = _prefs.getString(CacheKeys.deviceInfo);
    return data == null ? null : jsonDecode(data);
  }

  // ---------- Onboard ----------
  static void saveOnboard(bool value) =>
      _prefs.setBool(CacheKeys.onboard, value);

  static bool getOnboard() =>
      _prefs.getBool(CacheKeys.onboard) ?? false;

  // ---------- Language ----------
  static void saveLanguage(String value) =>
      _prefs.setString(CacheKeys.language, value);

  static String getLanguage() =>
      _prefs.getString(CacheKeys.language) ?? 'uz';

  // ---------- Token ----------
  static void saveToken(String token) =>
      _prefs.setString(CacheKeys.token, token);

  static String getToken() =>
      _prefs.getString(CacheKeys.token) ?? '';

  static void saveRefreshToken(String token) =>
      _prefs.setString(CacheKeys.refreshToken, token);

  static String getRefreshToken() =>
      _prefs.getString(CacheKeys.refreshToken) ?? '';

  // ---------- User ----------
  static void saveUserId(String id) =>
      _prefs.setString(CacheKeys.userId, id);

  static String getUserId() =>
      _prefs.getString(CacheKeys.userId) ?? "0";

  static void saveBalance(int value) =>
      _prefs.setInt(CacheKeys.balance, value);

  static int getBalance() =>
      _prefs.getInt(CacheKeys.balance) ?? 0;

  static void saveLogin(String value) =>
      _prefs.setString(CacheKeys.login, value);

  static String getLogin() =>
      _prefs.getString(CacheKeys.login) ?? '';

  static void saveAvatar(String value) =>
      _prefs.setString(CacheKeys.avatar, value);

  static String getAvatar() =>
      _prefs.getString(CacheKeys.avatar) ?? '';

  static void saveFirstName(String value) =>
      _prefs.setString(CacheKeys.firstName, value);

  static String getFirstName() =>
      _prefs.getString(CacheKeys.firstName) ?? '';

  static void saveLastName(String value) =>
      _prefs.setString(CacheKeys.lastName, value);

  static String getLastName() =>
      _prefs.getString(CacheKeys.lastName) ?? '';

  static void saveGender(String value) =>
      _prefs.setString(CacheKeys.gender, value);

  static String getGender() =>
      _prefs.getString(CacheKeys.gender) ?? '';

  static void saveBirthDate(String value) =>
      _prefs.setString(CacheKeys.birthDate, value);

  static String getBirthDate() =>
      _prefs.getString(CacheKeys.birthDate) ?? '';

  static void savePhone(String value) =>
      _prefs.setString(CacheKeys.phone, value);

  static String getPhone() =>
      _prefs.getString(CacheKeys.phone) ?? '';

  // ---------- Region ----------
  static void saveRegionName(String value) =>
      _prefs.setString(CacheKeys.regionName, value);

  static String getRegionName() =>
      _prefs.getString(CacheKeys.regionName) ?? '';

  static void saveRegionId(int id) =>
      _prefs.setInt(CacheKeys.regionId, id);

  static int getRegionId() =>
      _prefs.getInt(CacheKeys.regionId) ?? 1;

}