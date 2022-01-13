import 'package:asunnyday/utils/snackbar_creator.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class PermissionProvider extends ChangeNotifier {
  static const _serviceNotEnabled = "Service Not Enabled";
  static const _locationServiceDenied = "We need Location Service!";
  bool? isPermissionEnabled;

  dynamic checkOrRequestForPermission(BuildContext context) async {
    LocationPermission permission;

    bool _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      isPermissionEnabled = false;
      SnackBarCreator.showSnackBar(context, _serviceNotEnabled);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      SnackBarCreator.showSnackBar(context, _locationServiceDenied);
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isPermissionEnabled = false;
        return;
      } else {
        isPermissionEnabled = true;
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }
  }
}
