import 'package:asunnyday/utils/constants.dart';
import 'package:asunnyday/view/screens/home_screen.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
import 'package:asunnyday/view_model/home/current_weather_provider.dart';
import 'package:asunnyday/view_model/internationalization/app_language.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CurrentLocationProvider()),
        ChangeNotifierProvider(create: (_) => CurrentWeatherProvider()),
      ],
      //For Theme and Language
      child: Consumer2<ThemeProvider, AppLanguageProvider>(
        builder: (cxt, themeProvider, appLanguageProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'asunnyday',
            theme: ThemeProvider.lightTheme,
            darkTheme: ThemeProvider.darkTheme,
            themeMode: themeProvider.currentTheme,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: Constants.supportedLanguagesCodes.map((e) => Locale(e, '')).toList(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
