import 'package:asunnyday/view/screens/home/widget/icon_text_widget.dart';
import 'package:asunnyday/view/screens/home/widget/weather_icon_widget.dart';
import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:asunnyday/view_model/weather/current_weather_provider.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherReportWidget extends StatelessWidget {
  const WeatherReportWidget({Key? key}) : super(key: key);

  BoxDecoration _boxDecoration(ThemeProvider themeProvider) {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        color: themeProvider.containerColor,
        boxShadow: [themeProvider.boxShadow],
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusDefault));
  }

  static const _padding = EdgeInsets.all(AppTheme.paddingSmall);
  final _smallPadding = const SizedBox(height: AppTheme.paddingSmall);

  @override
  Widget build(BuildContext context) {
    final _containerHeight = MediaQuery.of(context).size.width - (2 * AppTheme.defaultPadding);
    return Consumer2<ThemeProvider, CurrentWeatherProvider>(
      builder: (cxt, themeProvider, currentWeatherProvider, child) {
        //Initializing Max Temperature for null case
        final _maxTemperature = currentWeatherProvider.weatherResponse?.maxTemperature ?? 24;
        //Initializing Min Temperature for null case
        final _minTemperature = currentWeatherProvider.weatherResponse?.minTemperature ?? 14;
        //Initializing Average Temperature for null case
        final _averageTemperature = (_maxTemperature + _minTemperature) ~/ 2;
        //Initializing WeatherExpectation for null case
        final _weatherExpectation =
            currentWeatherProvider.weatherResponse?.weatherExpectation ?? "Have a Great Day! 😁";

        return Container(
          padding: _padding,
          height: _containerHeight,
          width: _containerHeight,
          decoration: _boxDecoration(themeProvider),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Displays Weather Icon Based on current weather condition
              WeatherIconWidget(themeProvider: themeProvider),
              _smallPadding,
              //Shows Maximum Temperature
              IconTextWidget(
                  text: "$_maxTemperature${AppLocalizations.of(context).translate("degree_celsius")}"
                      " ${AppLocalizations.of(context).translate("maximum_temperature")}",
                  isMax: true),
              _smallPadding,
              //Shows Average Temperature
              IconTextWidget(
                  text: "$_averageTemperature${AppLocalizations.of(context).translate("degree_celsius")} "
                      "${AppLocalizations.of(context).translate("average_temperature")}",
                  isAverage: true),
              _smallPadding,
              //Shows Average Temperature
              IconTextWidget(
                text: "$_minTemperature${AppLocalizations.of(context).translate("degree_celsius")} "
                    "${AppLocalizations.of(context).translate("minimum_temperature")}",
                isMin: true,
              ),
              _smallPadding,
              //Shows the day's average weather condition in a statement
              TextWidget(
                  text: _weatherExpectation,
                  fontFamily: AppTheme.fontFamilyButler,
                  fontSize: AppTheme.fontSizeButlerMedium,
                  fontWeight: AppTheme.fontWeight700),
            ],
          ),
        );
      },
    );
  }
}
