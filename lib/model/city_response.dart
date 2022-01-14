class CityResponse {
  String? locationKey;
  String? cityName;

  CityResponse(this.locationKey, this.cityName);

  CityResponse.fromJson(Map<String,dynamic> json) {
    locationKey = json['Key'];
    cityName = json['EnglishName'];
  }
}
