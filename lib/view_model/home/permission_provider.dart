import 'package:asunnyday/routers.dart';
import 'package:asunnyday/utils/snackbar_creator.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class PermissionProvider extends ChangeNotifier {
  static const _serviceNotEnabled = "Service Not Enabled";
  static const _locationServiceDenied = "We need Location Service!";
  bool isPermissionGranted = false;
  bool isLocationServiceEnabled = false;

  dynamic checkForLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isPermissionGranted = false;
        return;
      } else if (permission == LocationPermission.deniedForever) {
        isLocationServiceEnabled = false;
        return;
      } else {
        isPermissionGranted = true;
        return;
      }
    }
  }

  dynamic checkForLocationService(BuildContext context) async {
    bool _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      isLocationServiceEnabled = false;
      SnackBarCreator.showSnackBar(context, _serviceNotEnabled);
      return;
    } else {
      isLocationServiceEnabled = true;
      return;
    }
  }

  Future<void> initializePermissionAndNavigate(BuildContext context) async {
    await checkForLocationPermission(context);
    await checkForLocationService(context);
    if (isPermissionGranted && isLocationServiceEnabled) {
      Routers.showHomeScreen(context);
      return;
    } else if ((isPermissionGranted == false) || (isLocationServiceEnabled == false)) {
      Routers.showPermissionQuestionScreen(context);
      return;
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
