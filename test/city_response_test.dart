import 'package:asunnyday/model/city_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("This will return a city name and a key", () {
    //
    final CityResponse _expectedCityResponse = CityResponse("1234", "Kathmandu");
    //
    final CityResponse _cityResponse = CityResponse.fromJson(values);
    //
    expect("${_expectedCityResponse.cityName} ${_expectedCityResponse.locationKey}",
        "${_cityResponse.cityName} ${_cityResponse.locationKey}");
  });
}

const Map<String, dynamic> values = {
  "Key": "1234",
  "bla_bla": "bla_bla",
  "more_bla-bla": "more_bla-bla",
  "EnglishName": "Kathmandu"
};
