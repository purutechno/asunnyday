class WeatherResponse {
  //A string that exposes the overall weather condition
  //of a day
  String? weatherExpectation;
  int? minTemperature;
  int? maxTemperature;

  WeatherResponse(this.weatherExpectation, this.maxTemperature, this.minTemperature);

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    weatherExpectation = json['Headline']['Text'];
    minTemperature = json['DailyForecasts'][0]['Temperature']['Minimum']['Value'];
    maxTemperature = json['DailyForecasts'][0]['Temperature']['Maximum']['Value'];
  }
}
