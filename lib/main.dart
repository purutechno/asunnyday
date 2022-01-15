import 'package:asunnyday/utils/constants.dart';
import 'package:asunnyday/view/screens/init_screen.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
import 'package:asunnyday/view_model/weather/current_weather_provider.dart';
import 'package:asunnyday/view_model/home/permission_provider.dart';
import 'package:asunnyday/view_model/internationalization/app_language.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/search/multi_city_provider.dart';
import 'package:asunnyday/view_model/search/search_state_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    //App can be viewed only in two vertical orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //MultiProvider is a widget based on provider library
    //For More Info, visit : https://pub.dev/packages/provider
    return MultiProvider(
      providers: [
        //This Provider can change language [Can add multiple language
        // in the app and switch between them.]
        ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
        //This Provider can change Theme [ Can add multiple themes
        // like light, dark and switch between them.]
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        //This Provider can get the users current location
        //if the user has accepted location permission and
        //enabled location using geolocator plugin
        //For more info, visit :- https://pub.dev/packages/geolocator
        //It also uses the accuweather API to get the name of the city,
        //For more info, visit :- https://developer.accuweather.com/accuweather-locations-api/apis/get/locations/v1/cities/geoposition/search
        ChangeNotifierProvider(create: (_) => CurrentLocationProvider()),
        //This Provider can get the weather details
        // of a place based on it's location key using
        // the accuweather API,
        //For more info, visit :- https://developer.accuweather.com/accuweather-forecast-api/apis/get/forecasts/v1/daily/1day/%7BlocationKey%7D
        ChangeNotifierProvider(create: (_) => CurrentWeatherProvider()),
        //This Provider takes care of asking Location Permission using
        // geolocator plugins' default permission handler
        // and navigates to the screen based on users' response for
        //the first time [When the app is opened ]. However, the
        //overall Navigation is facilitates by Routers
        ChangeNotifierProvider(create: (_) => PermissionProvider()),
        //This Provider is simply responsible for handling the
        //state of Search Screen
        ChangeNotifierProvider(create: (_) => SearchStateProvider()),
        //This Provider is responsible for getting
        //response of multiple cities based on user's query
        //using the accuweather API
        //For more info, visit :- https://developer.accuweather.com/accuweather-locations-api/apis/get/locations/v1/cities/autocomplete
        ChangeNotifierProvider(create: (_) => MultiCityProvider()),
      ],
      //Consumer listens to Theme and Language changes
      child: Consumer2<ThemeProvider, AppLanguageProvider>(
        builder: (cxt, themeProvider, appLanguageProvider, child) {
          return MaterialApp(
            locale: appLanguageProvider.appLocale,
            debugShowCheckedModeBanner: false,
            title: 'asunnyday',
            theme: themeProvider.currentTheme,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: Constants.supportedLanguagesCodes.map((e) => Locale(e, '')).toList(),
            home: const InitScreen(),
          );
        },
      ),
    );
  }
}
