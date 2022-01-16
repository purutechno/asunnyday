import 'package:asunnyday/view_model/weather/current_weather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

enum WeatherIcons { cool, average, hot }

class WeatherIconProvider extends ChangeNotifier {
  WeatherIcons? requiredIcon;

  // Gets the Icon to be displayed
  void getIcon(BuildContext context) {
    final _currentWeatherProvider = Provider.of<CurrentWeatherProvider>(context, listen: false);
    // temperature below 15 C = cool
    if ((_currentWeatherProvider.weatherResponse?.minTemperature ?? 0) < 15) {
      requiredIcon = WeatherIcons.cool;
    }
    // temperature above 15 C to 28 C = average
    else if (((_currentWeatherProvider.averageTemperature ?? 0) >= 15) ||
        ((_currentWeatherProvider.averageTemperature ?? 0) <= 28)) {
      requiredIcon = WeatherIcons.average;
    }
    // temperature above 28 C to above = hot
    else {
      requiredIcon = WeatherIcons.hot;
    }
  }
}
