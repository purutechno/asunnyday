import 'dart:io';
import 'package:asunnyday/routers.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
import 'package:asunnyday/view_model/home/current_weather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class PermissionProvider extends ChangeNotifier {
  bool isPermissionGranted = false;
  bool isLocationServiceEnabled = false;

  //This function sets the above boolean isPermissionGranted
  dynamic checkForLocationPermission(BuildContext context, {bool requestOnceMore = false}) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if ((permission == LocationPermission.unableToDetermine) ||
        requestOnceMore ||
        (permission == LocationPermission.denied)) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      isPermissionGranted = false;
    } else if (permission == LocationPermission.deniedForever) {
      isPermissionGranted = false;
    } else if ((permission == LocationPermission.whileInUse) || (permission == LocationPermission.always)) {
      isPermissionGranted = true;
    }
    return;
  }

  //This function sets the above boolean isLocationServiceEnabled
  dynamic checkForLocationService(BuildContext context) async {
    bool _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (_serviceEnabled) {
      isLocationServiceEnabled = true;
    } else {
      isLocationServiceEnabled = false;
    }
    return;
  }

  //This function takes care of the routes and permission as a whole
  Future<void> initializePermissionAndNavigate(BuildContext context, {bool questionScreen = true}) async {
    final _currentLocationProvider = Provider.of<CurrentLocationProvider>(context, listen: false);
    //Checking if the platform is Android or IOS
    if (Platform.isAndroid || Platform.isIOS) {
      //Checking for Location Permission
      await checkForLocationPermission(context, requestOnceMore: !questionScreen);
      //Verifying that the location service is enabled
      await checkForLocationService(context);
      if (isPermissionGranted && isLocationServiceEnabled) {
        //Getting Current Location of the User
        await _currentLocationProvider.getCurrentLocation();
        await _currentLocationProvider.getCurrentCity();
        //Getting Weather Condition of the Current Location
        await Provider.of<CurrentWeatherProvider>(context, listen: false).getWeatherOfCity(context);
        Routers.showHomeScreen(context);
      } else if (((isPermissionGranted == false) || (isLocationServiceEnabled == false)) && questionScreen) {
        //Displaying the Pop-up with instructions
        Routers.showPermissionQuestionScreen(context);
      } else {
        //Simply Navigate to Search Screen
        denyPermissionAndNavigate(context);
      }
    } else {
      // Web is not able to detect position for users due to error in it's null safe library - @Purushottam
      //Navigating Directly to Search Screen
      denyPermissionAndNavigate(context);
    }
    //Terminate the function
    return;
  }

  //This Function simply navigates to Search Screen
  void denyPermissionAndNavigate(BuildContext context) {
    Routers.showSearchScreen(context);
    return;
  }
}
