import 'package:asunnyday/model/single_city_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("This will return a city name and a key", () {
    //
    final SingleCityResponse _expectedCityResponse = SingleCityResponse("1234", "Kathmandu");
    //
    final SingleCityResponse _cityResponse = SingleCityResponse.fromJson(values);
    //
    expect("${_expectedCityResponse.cityName} ${_expectedCityResponse.locationKey}",
        "${_cityResponse.cityName} ${_cityResponse.locationKey}");
  });
}

//Response from the API
const Map<String, dynamic> values = {
  "Key": "1234",
  "bla_bla": "bla_bla",
  "more_bla-bla": "more_bla-bla",
  "EnglishName": "Kathmandu"
};
