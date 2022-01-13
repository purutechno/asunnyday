import 'package:flutter/cupertino.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale? _appLocale;

  Locale get appLocale => _appLocale ?? const Locale("sv");

  String getLanguageCode() {
    if (appLocale.languageCode == "sv") {
      return "se";
    } else {
      return appLocale.languageCode;
    }
  }

  fetchLocale() async {
    const languageCode = "en";
    changeLanguage(const Locale(languageCode));
  }

  void changeLanguage(
    Locale locale,
  ) async {
    if (appLocale == locale) {
      return;
    }
    _appLocale = locale;
    notifyListeners();
  }
}
