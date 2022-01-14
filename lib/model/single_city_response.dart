class SingleCityResponse {
  String? locationKey;
  String? cityName;

  SingleCityResponse(this.locationKey, this.cityName);

  SingleCityResponse.fromJson(Map<String,dynamic> json) {
    locationKey = json['Key'];
    cityName = json['EnglishName'];
  }
}
