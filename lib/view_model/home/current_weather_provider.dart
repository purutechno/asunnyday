import 'dart:io';

import 'package:asunnyday/model/weather_response.dart';
import 'package:asunnyday/view_model/api_helper/api_exceptions.dart';
import 'package:asunnyday/view_model/api_helper/base_api_helpers.dart';
import 'package:asunnyday/view_model/api_helper/base_apis.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherProvider extends ChangeNotifier {
  WeatherResponse? weatherResponse;
  int? averageTemperature;

  Future<void> getWeatherOfCity(BuildContext context) async {
    String? cityKey = Provider.of<CurrentLocationProvider>(context, listen: false).cityResponse?.locationKey;
    if (cityKey != null) {
      try {
        var url = Uri.parse(BaseApis.weatherOfACity(cityKey));
        var rawResponse = await http.get(url);
        var apiResponse = BaseApiHelpers.returnResponse(rawResponse);
        final weatherResponse = WeatherResponse.fromJson(apiResponse);
        //converting Fahrenheit scale to Celsius
        this.weatherResponse = WeatherResponse(
            weatherResponse.weatherExpectation,
            _convertFahrenheitToCelsius(weatherResponse.maxTemperature).toDouble(),
            _convertFahrenheitToCelsius(weatherResponse.minTemperature).toDouble());
        //getting Average Temperature
        _getAverageTemperature();
      } on SocketException {
        //print('No Internet Connection');
        throw FetchDataException('No Internet connection');
      }
    }
  }

  //Converts the Fahrenheit scale into Celsius
  int _convertFahrenheitToCelsius(double? tempInFahrenheit) {
    return (((tempInFahrenheit ?? 0) - 32) * (5 / 9)).toInt();
  }

  //Gets the average Temperature
  void _getAverageTemperature() {
    averageTemperature = (((weatherResponse?.minTemperature ?? 0) + (weatherResponse?.maxTemperature ?? 0)) ~/ 2);
  }
}
