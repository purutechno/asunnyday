import 'package:asunnyday/utils/constants.dart';
import 'package:asunnyday/utils/null_replacer.dart';

class BaseApis {
  static const String _baseUrlForCitySearchByPosition =
      "http://dataservice.accuweather.com/locations/v1/cities/geoposition";
  static const String _action = "/search?";
  static const String _apiKeyString = "apikey=";
  static const String _query = "&q=";
  static const String _comma = "%2C";

  static String cityByLatitudeAndLongitude(
          {double? latitude = NullReplacer.latitude, double? longitude = NullReplacer.longitude}) =>
      "$_baseUrlForCitySearchByPosition$_action$_apiKeyString${Constants.accuWeatherApiKey}$_query$latitude$_comma$longitude";
}
