import 'package:asunnyday/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class PermissionProvider extends ChangeNotifier {
  bool isPermissionGranted = false;
  bool isLocationServiceEnabled = false;

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

  dynamic checkForLocationService(BuildContext context) async {
    bool _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (_serviceEnabled) {
      isLocationServiceEnabled = true;
    } else {
      isLocationServiceEnabled = false;
    }
    return;
  }

  Future<void> initializePermissionAndNavigate(BuildContext context, {bool questionScreen = true}) async {
    await checkForLocationPermission(context, requestOnceMore: !questionScreen);
    await checkForLocationService(context);
    if (isPermissionGranted && isLocationServiceEnabled) {
      Routers.showHomeScreen(context);
    } else if (((isPermissionGranted == false) || (isLocationServiceEnabled == false)) && questionScreen) {
      Routers.showPermissionQuestionScreen(context);
    } else {
      denyPermissionAndNavigate(context);
    }
    return;
  }

  void denyPermissionAndNavigate(BuildContext context) {
    Routers.showSearchScreen(context);
    return;
  }
}
