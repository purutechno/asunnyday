import 'dart:convert';
import 'package:asunnyday/utils/constants.dart';
import 'package:asunnyday/view_model/api_helper/api_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseApiHelpers {
  static Map<String, String> headersForCityName({
    required double latitude,
    required double longitude,
  }) {
    return {'apiKey': Constants.accuWeatherApiKey, 'q': '$latitude,$longitude'};
  }

  static dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw InternalServerError(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
