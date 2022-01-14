import 'dart:io';
import 'package:asunnyday/model/city_response.dart';
import 'package:asunnyday/view_model/api_helper/api_exceptions.dart';
import 'package:asunnyday/view_model/api_helper/base_api_helpers.dart';
import 'package:asunnyday/view_model/api_helper/base_apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class CurrentLocationProvider extends ChangeNotifier {
  Position? position;
  CityResponse? cityResponse;

  //This function gets the current Position of user
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    this.position = position;
    return position;
  }

  //This function gets the city cityResponse
  Future<void> getCurrentCity() async {
    //checking to make sure the latitude nad longitude are not null
    if ((position?.latitude != null) && (position?.longitude != null)) {
      try {
        var url = Uri.parse(
            BaseApis.cityByLatitudeAndLongitude(latitude: position?.latitude, longitude: position?.longitude));
        var rawResponse = await http.get(url);
        var apiResponse = BaseApiHelpers.returnResponse(rawResponse);
        cityResponse = CityResponse.fromJson(apiResponse);
      } on SocketException {
        //print('No Internet Connection');
        throw FetchDataException('No Internet connection');
      }
    } else {
      //print("Either Latitude or Longitude is null");
    }
    return;
  }
}
