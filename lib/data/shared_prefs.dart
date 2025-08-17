import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsData {
  static const String finishedGuideKey = "finishedGuide";
  static const String sysStatus = "sysStatus";
  static const String sysActivity = "sysActivity"; // enteries, exits, blocked

  // sysActivity
  static Future<void> setSysActivity({required List<int> value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      sysActivity,
      value.map((i) => i.toString()).toList(),
    );
  }

  static Future<List<int>> getSysActivity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs
            .getStringList(sysActivity)
            ?.map((i) => int.parse(i))
            .toList() ??
        const [0, 0, 0];
  }

  // sysStatus
  static Future<void> setSysStatus({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(sysStatus, value);
  }

  static Future<bool> getSysStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sysStatus) ?? false;
  }

  // finishedGuideKey
  static Future<void> setFinishedGuide({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(finishedGuideKey, value);
  }

  static Future<bool> getFinishedGuide() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(finishedGuideKey) ?? false;
  }

  // clear all
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // reset all
  static void resetAll() {
    setSysStatus(value: false);
    setFinishedGuide(value: false);
  }

  // log all
  static Future<void> logAll() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (final key in keys) {
      final value = prefs.get(key);
      log('SharedPrefs: $key => $value');
    }
  }
}
