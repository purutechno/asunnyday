import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationProvider extends ChangeNotifier {
  Position? position;

  //This function gets the current Position of user
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    this.position = position;
    return position;
  }
}
