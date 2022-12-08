import 'package:traval/localization/ar.dart';
import 'package:traval/localization/en.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('ar');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('ar');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    {
      "lang": 'عربي',
      "code": "ar",
    },
    {
      "lang": 'English',
      "code": "en",
    },
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('ar'),
    const Locale('en'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arTranslation,
        'en': enTranslation,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
