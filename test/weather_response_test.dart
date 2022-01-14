import 'package:asunnyday/model/weather_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Weather Response Test", () {
    //
    final WeatherResponse _expectedWeatherResponse = WeatherResponse("Expect showers Sunday", 95, 53);
    //
    final WeatherResponse _weatherResponse = WeatherResponse.fromJson(weatherResponse);
    //
    expect(
        "${_expectedWeatherResponse.weatherExpectation}${_expectedWeatherResponse.minTemperature}${_expectedWeatherResponse.maxTemperature}",
        "${_weatherResponse.weatherExpectation}${_weatherResponse.minTemperature}${_weatherResponse.maxTemperature}");
  });
}

//Response from the API
const Map<String, dynamic> weatherResponse = {
  "Headline": {
    "EffectiveDate": "2022-01-16T07:00:00+02:00",
    "EffectiveEpochDate": 1642309200,
    "Severity": 5,
    "Text": "Expect showers Sunday",
    "Category": "rain",
    "EndDate": "2022-01-16T19:00:00+02:00",
    "EndEpochDate": 1642352400,
    "MobileLink": "http://www.accuweather.com/en/na/kamanjab/243964/daily-weather-forecast/243964?lang=en-us",
    "Link": "http://www.accuweather.com/en/na/kamanjab/243964/daily-weather-forecast/243964?lang=en-us"
  },
  "DailyForecasts": [
    {
      "Date": "2022-01-14T07:00:00+02:00",
      "EpochDate": 1642136400,
      "Temperature": {
        "Minimum": {"Value": 53, "Unit": "F", "UnitType": 18},
        "Maximum": {"Value": 95, "Unit": "F", "UnitType": 18}
      },
      "Day": {"Icon": 4, "IconPhrase": "Intermittent clouds", "HasPrecipitation": false},
      "Night": {"Icon": 38, "IconPhrase": "Mostly cloudy", "HasPrecipitation": false},
      "Sources": ["AccuWeather"],
      "MobileLink": "http://www.accuweather.com/en/na/kamanjab/243964/daily-weather-forecast/243964?day=1&lang=en-us",
      "Link": "http://www.accuweather.com/en/na/kamanjab/243964/daily-weather-forecast/243964?day=1&lang=en-us"
    }
  ]
};
