import 'package:asunnyday/utils/constants.dart';
import 'package:asunnyday/utils/null_replacer.dart';

class BaseApis {
  //Serving URl of API
  static const String _baseUrl = "http://dataservice.accuweather.com";
  static const String _baseUrlForCitySearchByPosition = "/locations/v1/cities/";
  static const String _geoPosition = "geoposition";
  static const String _autoComplete = "autocomplete";
  static const _baseUrlForOneDayWeatherForecast = "/forecasts/v1/daily/1day/";
  static const String _action = "/search";
  static const String _apiKeyString = "?apikey=";
  static const String _query = "&q=";
  static const String _comma = "%2C";


/*  apikey=V33VW106EG9Xf2EpZ5mSATRi5yMd9b6v&q=37.4219481%2C-122.0835072"*/

  //Query URL to fetch the details of a city by latitude and longitude
  static String cityByLatitudeAndLongitude(
          {double? latitude = NullReplacer.latitude, double? longitude = NullReplacer.longitude}) =>
      "$_baseUrl$_baseUrlForCitySearchByPosition$_geoPosition$_action$_apiKeyString${Constants.accuWeatherApiKey}$_query$latitude$_comma$longitude";

  //Query URL to fetch the weather condition of a city by a location key
  static String weatherOfACity(String cityKey) =>
      "$_baseUrl$_baseUrlForOneDayWeatherForecast$cityKey$_apiKeyString${Constants.accuWeatherApiKey}";

  //Query URL to fetch the list of suggested city based on users' query
  static String getCitySuggestions(String query) =>
      "$_baseUrl$_baseUrlForCitySearchByPosition$_autoComplete$_apiKeyString${Constants.accuWeatherApiKey}$_query$query";
}
