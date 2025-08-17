import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtil {
  static const String finishedGuideKey = "finishedGuide";

  static Future<void> setFinishedGuide({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(finishedGuideKey, value);
  }

  static Future<bool> getFinishedGuide() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(finishedGuideKey) ?? false;
  }
}
