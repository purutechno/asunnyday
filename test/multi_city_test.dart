import 'package:asunnyday/model/multi_city_response.dart';
import 'package:asunnyday/model/single_city_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Multi City Test Based on query", () {
    // Adding data from the list at 0th Index
    SingleCityResponse _desiredResponse = SingleCityResponse("241809", "Kathmandu, Bagmati, Nepal");
    //Getting the entire list
    MultiCityResponse _response = MultiCityResponse.fromJson(multiCityResponse);
    //Comparing the value of _response[0] with _desiredResponse
    expect("${_desiredResponse.locationKey}${_desiredResponse.cityName}",
        "${_response.multiCityResponse[0].locationKey}${_response.multiCityResponse[0].cityName}");
  });
}

const List<Map<String, dynamic>> multiCityResponse = [
  {
    "Version": 1,
    "Key": "241809",
    "Type": "City",
    "Rank": 30,
    "LocalizedName": "Kathmandu",
    "Country": {"ID": "NP", "LocalizedName": "Nepal"},
    "AdministrativeArea": {"ID": "BA", "LocalizedName": "Bagmati"}
  },
  {
    "Version": 1,
    "Key": "359176",
    "Type": "City",
    "Rank": 55,
    "LocalizedName": "Kathua",
    "Country": {"ID": "IN", "LocalizedName": "India"},
    "AdministrativeArea": {"ID": "JK", "LocalizedName": "Jammu and Kashmir"}
  },
  {
    "Version": 1,
    "Key": "245230",
    "Type": "City",
    "Rank": 55,
    "LocalizedName": "Katha",
    "Country": {"ID": "MM", "LocalizedName": "Myanmar"},
    "AdministrativeArea": {"ID": "01", "LocalizedName": "Sagaing"}
  },
  {
    "Version": 1,
    "Key": "320080",
    "Type": "City",
    "Rank": 55,
    "LocalizedName": "Kathu",
    "Country": {"ID": "TH", "LocalizedName": "Thailand"},
    "AdministrativeArea": {"ID": "83", "LocalizedName": "Phuket"}
  },
  {
    "Version": 1,
    "Key": "2947418",
    "Type": "City",
    "Rank": 65,
    "LocalizedName": "Kathipudi",
    "Country": {"ID": "IN", "LocalizedName": "India"},
    "AdministrativeArea": {"ID": "AP", "LocalizedName": "Andhra Pradesh"}
  },
  {
    "Version": 1,
    "Key": "2816709",
    "Type": "City",
    "Rank": 65,
    "LocalizedName": "Kathana",
    "Country": {"ID": "IN", "LocalizedName": "India"},
    "AdministrativeArea": {"ID": "GJ", "LocalizedName": "Gujarat"}
  },
  {
    "Version": 1,
    "Key": "2952287",
    "Type": "City",
    "Rank": 65,
    "LocalizedName": "Kathanian",
    "Country": {"ID": "IN", "LocalizedName": "India"},
    "AdministrativeArea": {"ID": "PB", "LocalizedName": "Punjab"}
  },
  {
    "Version": 1,
    "Key": "3316388",
    "Type": "City",
    "Rank": 65,
    "LocalizedName": "Kathiraon",
    "Country": {"ID": "IN", "LocalizedName": "India"},
    "AdministrativeArea": {"ID": "UP", "LocalizedName": "Uttar Pradesh"}
  },
  {
    "Version": 1,
    "Key": "2880109",
    "Type": "City",
    "Rank": 65,
    "LocalizedName": "Kathalberia",
    "Country": {"ID": "IN", "LocalizedName": "India"},
    "AdministrativeArea": {"ID": "WB", "LocalizedName": "West Bengal"}
  },
  {
    "Version": 1,
    "Key": "223406",
    "Type": "City",
    "Rank": 65,
    "LocalizedName": "Kathekani",
    "Country": {"ID": "KE", "LocalizedName": "Kenya"},
    "AdministrativeArea": {"ID": "23", "LocalizedName": "Makueni"}
  }
];
