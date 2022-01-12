import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

ThemeProvider currentTheme = ThemeProvider();

class ThemeProvider with ChangeNotifier {
  static bool _isDarkTheme = true;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppTheme.colorBlackPurple,
        appBarTheme: const AppBarTheme(
          elevation: AppTheme.defaultElevation,
          backgroundColor: AppTheme.colorPurple,
          foregroundColor: AppTheme.colorPurple2,
          iconTheme: IconThemeData(
            color: AppTheme.colorPurple3,
          ),
        ),
        fontFamily: AppTheme.fontFamilyTTCommonsPro,
        textTheme: TextTheme(
          headline5: AppTheme.kDarkHeadline5,
          subtitle1: AppTheme.kDarkSubtitle1,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: AppTheme.colorPurple4,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppTheme.borderRadiusDefault,
              ),
            ),
            backgroundColor: AppTheme.colorPurple5,
            primary: AppTheme.colorPurple5,
            textStyle: AppTheme.kGenericTextButtonTextStyle,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppTheme.borderRadiusDefault,
              ),
            ),
            minimumSize: AppTheme.kElevatedButtonMinimumSize,
          ),
        ),
        colorScheme: const ColorScheme.dark(
          secondary: AppTheme.colorPurple4,
        ));
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppTheme.colorGreen,
      appBarTheme: const AppBarTheme(
        elevation: AppTheme.defaultElevation,
        backgroundColor: AppTheme.colorGreen1,
        foregroundColor: AppTheme.colorGreen2,
        iconTheme: IconThemeData(
          color: AppTheme.colorAccentGreen,
        ),
      ),
      fontFamily: AppTheme.fontFamilyTTCommonsPro,
      textTheme: TextTheme(
        headline5: AppTheme.kLightHeadline5,
        subtitle1: AppTheme.kLightSubtitle1,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppTheme.colorDarkGreen,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppTheme.borderRadiusDefault,
            ),
          ),
          backgroundColor: AppTheme.colorGreen1,
          primary: AppTheme.colorGreen2,
          textStyle: AppTheme.kGenericTextButtonTextStyle,
        ),
      ),
      colorScheme: const ColorScheme.light(
        secondary: AppTheme.colorGreen,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppTheme.borderRadiusDefault,
            ),
          ),
          minimumSize: AppTheme.kElevatedButtonMinimumSize,
        ),
      ),
    );
  }
}
