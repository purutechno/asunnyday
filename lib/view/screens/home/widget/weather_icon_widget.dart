import 'package:asunnyday/view_model/home/weather_icon_provider.dart';
import 'package:base/styles/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherIconWidget extends StatelessWidget {
  final ThemeProvider themeProvider;

  const WeatherIconWidget({Key? key, required this.themeProvider}) : super(key: key);

  static const iconSize = 100.00;

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherIconProvider>(
      builder: (cxt, weatherReportIconProvider, child) {
        weatherReportIconProvider.getIcon(context);
        if (weatherReportIconProvider.requiredIcon == WeatherIcons.cool) {
          return Icon(
            Icons.ac_unit_rounded,
            size: AppTheme.sizeRoundButtonBase,
            color: themeProvider.weatherIconColor,
          );
        }
        if (weatherReportIconProvider.requiredIcon == WeatherIcons.average) {
          return Icon(
            Icons.cloud,
            size: iconSize,
            color: themeProvider.weatherIconColor,
          );
        }
        if (weatherReportIconProvider.requiredIcon == WeatherIcons.hot) {
          return Icon(
            Icons.wb_sunny,
            size: iconSize,
            color: themeProvider.weatherIconColor,
          );
        }
        return const SizedBox();
      },
    );
  }
}
