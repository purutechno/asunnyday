import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = true;

  //This gets the boxShadow for all the containers in the app
  //Default Value is based on Default Theme
  BoxShadow get boxShadow => _isDarkTheme ? AppTheme.boxShadowWhite : AppTheme.boxShadowDefault;

  //This gets the color for all the containers in the app
  //Default Value is based on Default Theme
  Color get containerColor => _isDarkTheme ? AppTheme.colorCreamyWhite : AppTheme.colorBlackPurple;

  //Gets the active theme
  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  //Dark Theme for the app
  static ThemeData get darkTheme {
    //Text Style for dark Theme
    const textStyleForDarkTheme = TextStyle(color: AppTheme.colorCreamyWhite);

    final darkTextTheme = const TextTheme(
      bodyText2: textStyleForDarkTheme,
    ).apply(displayColor: AppTheme.colorCreamyWhite,bodyColor: AppTheme.colorCreamyWhite);

    //Text Button style i.e. ButtonWidget Style
    final darkTextButtonThemeData = TextButtonThemeData(
      style: TextButton.styleFrom(
        //Text Alignment
        alignment: Alignment.center,
        //Button Background Color
        backgroundColor: AppTheme.colorCreamyWhite,
        //Text Horizontal Padding
        padding: const EdgeInsets.symmetric(
            //Text Horizontal Padding
            horizontal: AppTheme.defaultPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusDefault),
        ),
      ),
    );

    return ThemeData(
        scaffoldBackgroundColor: AppTheme.colorBlackPurple,
        textButtonTheme: darkTextButtonThemeData,
        textTheme: darkTextTheme);
  }

  //Light Theme for the app
  static ThemeData get lightTheme {
    //Text Style for light Theme
    const textStyleForLightTheme = TextStyle(color: AppTheme.colorBlackPurple);

    const lightThemeTextStyles = TextTheme(
        //Text Style for Button Text
        button: textStyleForLightTheme,
        //Text Style for all Text in the app for lightTheme
        bodyText2: textStyleForLightTheme);

    final lightTextButtonTheme = TextButtonThemeData(
        style: TextButton.styleFrom(
      //Text Alignment
      alignment: Alignment.center,
      //Button Background Color
      backgroundColor: AppTheme.colorBlackPurple,
      //Text Horizontal Padding
      padding: const EdgeInsets.symmetric(
          //Text Horizontal Padding
          horizontal: AppTheme.defaultPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusDefault),
      ),
    ));

    return ThemeData(
        //For DarkTheme
        scaffoldBackgroundColor: AppTheme.colorCreamyWhite,
        textButtonTheme: lightTextButtonTheme,
        textTheme: lightThemeTextStyles);
  }
}
