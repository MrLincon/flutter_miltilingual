import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization/Language/language_ar.dart';
import '../localization/Language/language_en.dart';
import '../localization/Language/language_hi.dart';
import '../localization/Language/languages.dart';

class LanguageProvider extends ChangeNotifier {
  Languages _currentLanguage = LanguageAr(); // Default language

  Languages get currentLanguage => _currentLanguage;

  Future<void> changeLanguage(Languages newLanguage, String language) async {
    _currentLanguage = newLanguage;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedLanguage', language);

    print(language);
  }

  Future<void> loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedLanguage = prefs.getString('selectedLanguage');

    print(selectedLanguage);

    if (selectedLanguage != null) {
      switch (selectedLanguage) {
        case 'LanguageEn':
          _currentLanguage = LanguageEn();
          notifyListeners();
          print("${selectedLanguage} SET");
          break;
        case 'LanguageAr':
          _currentLanguage = LanguageAr();
          notifyListeners();
          print("${selectedLanguage} SET");
          break;
        case 'LanguageHi':
          _currentLanguage = LanguageHi();
          notifyListeners();
          print("${selectedLanguage} SET");
          break;
      // Add more language cases as needed
      }
      notifyListeners();
    }
  }

  Locale get locale {
    if (_currentLanguage is LanguageEn) {
      return Locale('en', '');
    } else if (_currentLanguage is LanguageAr) {
      return Locale('ar', '');
    } else if (_currentLanguage is LanguageHi) {
      return Locale('hi', '');
    }
    return Locale('en', '');
  }
}