import 'package:flutter/material.dart';
import 'package:base/styles/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  bool isPurpleTheme = true;

  //Theme data for Text Button :- Button widget
  ButtonStyle getButtonColor({bool toggle = false}) {
    if (isPurpleTheme) {
      if (toggle) {
        return darkTextButtonStyles;
      }
      return lightTextButtonStyles;
    } else {
      if (toggle) {
        return lightTextButtonStyles;
      }

      return darkTextButtonStyles;
    }
  }

  Color get weatherIconColor =>
      isPurpleTheme ? AppTheme.colorBlackPurple : AppTheme.colorCreamyWhite;

  //Button Text Color :- Button Widget
  Color buttonTextColor({bool toggle = false}) {
    if (isPurpleTheme) {
      if (toggle) {
        return AppTheme.colorBlackPurple;
      }
      return AppTheme.colorCreamyWhite;
    } else {
      if (toggle) {
        return AppTheme.colorCreamyWhite;
      }
      return AppTheme.colorBlackPurple;
    }
  }

  //The text inside the search field color
  Color get searchFieldColor =>
      isPurpleTheme ? AppTheme.colorBlackPurple : AppTheme.colorCreamyWhite;

  //Theme Switcher Color
  Color get switcherColor =>
      isPurpleTheme ? AppTheme.colorBlackPurple : AppTheme.colorCreamyWhite;

  //This gets the boxShadow for all the containers in the app
  //Default Value is based on Default Theme
  BoxShadow get boxShadow =>
      isPurpleTheme ? AppTheme.boxShadowWhite : AppTheme.boxShadowDefault;

  //This gets the color for all the containers in the app
  //Default Value is based on Default Theme
  Color get containerColor =>
      isPurpleTheme ? AppTheme.colorCreamyWhite : AppTheme.colorBlackPurple;

  //Gets the active styles
  ThemeMode get currentTheme =>
      isPurpleTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isPurpleTheme = !isPurpleTheme;
    notifyListeners();
  }

  //Dark Theme for the app
  ButtonStyle darkTextButtonStyles = TextButton.styleFrom(
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
  );

  //Text Button style i.e. ButtonWidget Style
  TextButtonThemeData darkTextButtonThemeData() => TextButtonThemeData(
        style: darkTextButtonStyles,
      );

  ThemeData get purpleTheme {
    //Text Style for dark Theme
    const textStyleForDarkTheme = TextStyle(color: AppTheme.colorBlackPurple);

    //Text Style for all Text in the app for lightTheme [Note : This method
    // is not triggering the text color :- Base Text Widget is configured Directly]
    final darkTextTheme = const TextTheme(
      bodyText2: textStyleForDarkTheme,
    ).apply(
        displayColor: AppTheme.colorBlackPurple,
        bodyColor: AppTheme.colorBlackPurple);

    return ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppTheme.colorBlackPurple,
        textButtonTheme: darkTextButtonThemeData(),
        textTheme: darkTextTheme);
  }

  //Light Theme for the app
  final lightTextButtonStyles = TextButton.styleFrom(
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
  );

  TextButtonThemeData lightTextButtonTheme() =>
      TextButtonThemeData(style: lightTextButtonStyles);

  ThemeData get creamyWhiteTheme {
    //Text Style for light Theme
    const textStyleForLightTheme = TextStyle(color: AppTheme.colorCreamyWhite);

    //Text Style for all Text in the app for lightTheme [Note : This method
    // is not triggering the text color :- Base Text Widget is configured Directly]
    final lightThemeTextStyles = const TextTheme(
            button: textStyleForLightTheme, bodyText2: textStyleForLightTheme)
        .apply(
            displayColor: AppTheme.colorCreamyWhite,
            bodyColor: AppTheme.colorCreamyWhite);

    return ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppTheme.colorCreamyWhite,
        textButtonTheme: lightTextButtonTheme(),
        textTheme: lightThemeTextStyles);
  }
}
