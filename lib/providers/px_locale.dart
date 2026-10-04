import 'package:flutter/material.dart';
import 'package:proclinic_revamp/utils/shared_prefs.dart';

class PxLocale extends ChangeNotifier {
  static Locale _locale = const Locale("en");
  Locale get locale => _locale;

  void setLocale() {
    _locale = Locale(_lang);
    notifyListeners();
  }

  static String _lang = 'en';
  String get lang => _lang;
  static String get langStatic => _lang;

  Future<void> setLang(String value) async {
    _lang = value;
    await asyncPrefs.setString('lang', _lang);
    notifyListeners();
  }

  bool get isEnglish => lang == 'en' && locale == const Locale("en");

  String switchLang() {
    if (_lang == 'en') {
      return "ar";
    } else if (_lang == 'ar') {
      return 'en';
    } else {
      throw UnimplementedError();
    }
  }

  Future<void> switchLocale() async {
    _lang = switchLang();
    await asyncPrefs.setString('lang', _lang);
    notifyListeners();
    setLocale();
  }
}
