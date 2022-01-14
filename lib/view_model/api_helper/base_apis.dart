import 'package:asunnyday/utils/constants.dart';
import 'package:asunnyday/utils/null_replacer.dart';

class BaseApis {
  //Serving URl of API
  static const String _baseUrl = "http://dataservice.accuweather.com";
  static const String _baseUrlForCitySearchByPosition = "/locations/v1/cities/geoposition";
  static const _baseUrlForOneDayWeatherForecast = "/forecasts/v1/daily/1day/";
  static const String _questionMark = "?";
  static const String _action = "/search?";
  static const String _apiKeyString = "apikey=";
  static const String _query = "&q=";
  static const String _comma = "%2C";

  //Query URL to fetch the details of a city by latitude and longitude
  static String cityByLatitudeAndLongitude(
          {double? latitude = NullReplacer.latitude, double? longitude = NullReplacer.longitude}) =>
      "$_baseUrl$_baseUrlForCitySearchByPosition$_action$_apiKeyString${Constants.accuWeatherApiKey}$_query$latitude$_comma$longitude";

  //Query URL to fetch the weather condition of a city by a location key
  static String weatherOfACity(String cityKey) =>
      "$_baseUrl$_baseUrlForOneDayWeatherForecast$cityKey$_questionMark$_apiKeyString${Constants.accuWeatherApiKey}";
}
