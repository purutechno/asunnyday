import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorBackground = Color(0xFFFDFCF7);
  static const Color colorBlack = Color(0xFF000000);
  static const Color colorBlackPurple = Color(0xFF2A1D2C);
  static const Color colorPurple = Color(0xFF5F436E);
  static const Color colorPurple2 = Color(0xFF4B3159);
  static const Color colorPurple3 = Color(0xFFCCBBD4);
  static const Color colorPurple4 = Color(0xFF424168);
  static const Color colorPurple5 = Color(0xFF684159);
  static const Color colorSkyBlue = Color(0xFF3998AD);
  static const Color colorBlue = Color(0xFF24576B);
  static const Color colorBlue1 = Color(0xFF375052);
  static const Color colorBlue2 = Color(0xFF373F52);

  static const Color colorOlive = Color(0xFF4B6256);
  static const Color colorOrange = Color(0xFFFF9F78);
  static const Color colorOrange1 = Color(0xFFF1A37F);
  static const Color colorYellow = Color(0xFFF1BD1F);
  static const Color colorYellow1 = Color(0xFFAD803C);
  static const Color lightYellow = Color(0xFFEDDBCC);

  static const Color colorCreamyWhite = Color(0xFFFCEEE2);
  static const Color colorWhite = Colors.white;
  static const Color colorGrey = Color(0xFF716775);
  static const Color colorGrey2 = Color(0xFFE0DBCF);
  static const Color colorGrey3 = Color(0xFFD5D8E1);
  static const Color colorGrey4 = Color(0xFFDDDAE5);
  static const Color colorGrey5 = Color(0xFFEDDBCC);
  static const Color colorGrey6 = Color(0xFFEAE8E3);
  static const Color colorGrey7 = Color(0xFFD0C9BA);
  static const Color colorAccentGreen = Color(0xFF89BBA1);
  static const Color colorGreen = Color(0xFF7BC690);
  static const Color colorGreen1 = Color(0xFF28806B);
  static const Color colorGreen2 = Color(0xFF3C4F51);
  static const Color colorDarkGreen = Color(0xFF2B4A43);
  static const Color colorBrownBeige = Color(0xFFB7A99E);
  static const Color colorDarkYellow = Color(0xFFEED9C7);
  static const Color colorBrown = Color(0xFF9E7337);

  static const double disabledOpacity = 0.5;

  static const String fontFamilyButler = 'Butler'; // Headings
  static const double fontSizeButler = 30.0;
  static const double fontSizeButlerMedium = 24.0;
  static const String fontFamilyTTCommonsPro = 'TTCommonsPro'; // Inf
  static const double fontSizeTTCommonsPro = 18.0;
  static const double fontSizeTTCommonsPro16 = 16.0;
  static const double fontSizeTTCommonsProMedium = 17.0;
  static const double fontSizeTTCommonsProSmall = 14.0;

  static const double smallerButtonSize = 44.0;

  static const FontWeight fontWeight700 = FontWeight.w700;
  static const FontWeight fontWeight400 = FontWeight.w400;
  static const FontWeight fontWeight600 = FontWeight.w600;

  //boxShadow light mode
  static BoxShadow boxShadowDefault = BoxShadow(
    color: colorBlack.withOpacity(0.05),
    blurRadius: 24.0,
    offset: const Offset(0, 4.0),
  );


  //boxShadow dark mode
  static BoxShadow boxShadowWhite = BoxShadow(
    color: colorWhite.withOpacity(0.05),
    blurRadius: 24.0,
    offset: const Offset(0, 4.0),
  );


  //text color for light styles
  static const TextStyle textStylesLightTheme = TextStyle(
    color: AppTheme.colorBlackPurple,
  );

  //text color for dark Theme
  static const TextStyle textStylesDarkTheme =  TextStyle(
    color: AppTheme.colorCreamyWhite,
  );


  static const double borderRadiusDefault = 24.0;
  static const double borderRadiusSmall = 10.0;

  static const double sizeRoundButtonBase = 50;
  static const double sizeMediumButton = 48;
  static const double sizeSmallButton = 40;
  static const double sizeRoundButtonIcon =25;
  static const double sizeRoundButtonIconLarge = 100;

  static const double sizeDefaultButton = 60;
  static const int maxTextLines = 400;
  static const double modalButtonStandardWidth = 273;

  static const double defaultPadding = 24.0;
  static const double paddingSmall = 15.0;
}
