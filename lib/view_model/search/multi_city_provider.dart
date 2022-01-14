import 'dart:io';
import 'package:asunnyday/model/multi_city_response.dart';
import 'package:asunnyday/utils/api_helper/api_exceptions.dart';
import 'package:asunnyday/utils/api_helper/base_api_helpers.dart';
import 'package:asunnyday/utils/api_helper/base_apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MultiCityProvider extends ChangeNotifier {
  List<String> cityNAmes = [];

  void getMultipleCities(String query) async {
    try {
      if (query.isNotEmpty) {
        var url = Uri.parse(BaseApis.getCitySuggestions(query));
        var rawResponse = await http.get(url);
        var apiResponse = BaseApiHelpers.returnResponse(rawResponse);
        MultiCityResponse? multiCityResponse = MultiCityResponse.fromJson(apiResponse);
        if (multiCityResponse.multiCityResponse.isNotEmpty) {
          for (int a = 0; a < (multiCityResponse.multiCityResponse.length); a++) {
            //Avoiding Duplication
            if (!cityNAmes.contains(multiCityResponse.multiCityResponse[a].cityName)) {
              cityNAmes.add(multiCityResponse.multiCityResponse[a].cityName ?? "");
            }
          }
        }
        notifyListeners();
      }
    } on SocketException {
      //print('No Internet Connection');
      throw FetchDataException('No Internet connection');
    }
  }
}
