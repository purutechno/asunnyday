import 'dart:io';
import 'package:asunnyday/model/multi_city_response.dart';
import 'package:asunnyday/model/single_city_response.dart';
import 'package:asunnyday/routers.dart';
import 'package:asunnyday/utils/api_helper/api_exceptions.dart';
import 'package:asunnyday/utils/api_helper/base_api_helpers.dart';
import 'package:asunnyday/utils/api_helper/base_apis.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
import 'package:asunnyday/view_model/search/search_state_provider.dart';
import 'package:asunnyday/view_model/weather/current_weather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MultiCityProvider extends ChangeNotifier {
  //Obtained response while triggering getMultipleCities
  MultiCityResponse? multiCityResponse;

  //City Names used to display in Suggestion box
  List<String> cityNAmes = [];

  //This value is obtained when a user selects on a suggestion
  SingleCityResponse? selectedCity;

  //This function gets the list of multiple city suggestions from
  //the api based on users' entered query
  void getMultipleCities(String query) async {
    try {
      if (query.isNotEmpty) {
        var url = Uri.parse(BaseApis.getCitySuggestions(query));
        var rawResponse = await http.get(url);
        var apiResponse = BaseApiHelpers.returnResponse(rawResponse);
        multiCityResponse = MultiCityResponse.fromJson(apiResponse);
        if (multiCityResponse?.multiCityResponse.isNotEmpty ?? false) {
          for (int a = 0; a < (multiCityResponse?.multiCityResponse.length ?? 0); a++) {
            //Avoiding Duplication
            if (!cityNAmes.contains(multiCityResponse?.multiCityResponse[a].cityName)) {
              cityNAmes.add(multiCityResponse?.multiCityResponse[a].cityName ?? "");
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

  //This Function gets the weather condition for selected city and navigates to Home Screen
  Future<void> getWeatherAndNavigate(BuildContext ctx,
      {required String? locationKey, required String? cityName}) async {
    Routers.showLoadingScreen(ctx);
    //Directly assigning the cityResponse value when user clicks on suggestion in Search Screen
    Provider.of<CurrentLocationProvider>(ctx, listen: false).cityResponse = SingleCityResponse(locationKey, cityName);
    //Getting the weather of a city assigned to cityResponse above
    await Provider.of<CurrentWeatherProvider>(ctx, listen: false).getWeatherOfCity(ctx);
    //All values are set. So, navigating to Home Page again to display the Weather
    Routers.showHomeScreen(ctx, replace: true);
  }

  //This Function is triggered when a user taps on the city suggestions displayed by the users
  void onSuggestionCallback(String selectedCity) {
    try {
      for (int a = 0; a < (multiCityResponse?.multiCityResponse.length ?? 0); a++) {
        if (multiCityResponse?.multiCityResponse[a].cityName == selectedCity) {
          this.selectedCity = multiCityResponse?.multiCityResponse[a];
          return;
        }
      }
    } catch (e) {
/*      print(e.toString());*/
    }
  }
}
