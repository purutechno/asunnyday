import 'package:asunnyday/view/screens/home/widget/icon_text_widget.dart';
import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/weather/current_weather_provider.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherReportWidget extends StatelessWidget {
  WeatherReportWidget({Key? key}) : super(key: key);

  final BoxDecoration _boxDecoration =
      BoxDecoration(shape: BoxShape.circle, color: AppTheme.colorCreamyWhite, boxShadow: [AppTheme.boxShadowWhite]);
  static const _padding = EdgeInsets.all(AppTheme.paddingSmall);
  final _smallPadding = const SizedBox(height: AppTheme.paddingSmall);

  @override
  Widget build(BuildContext context) {
    final _containerHeight = MediaQuery.of(context).size.width - (2 * AppTheme.defaultPadding);
    return Consumer<CurrentWeatherProvider>(
      builder: (cxt, currentWeatherProvider, child) {
        return Container(
          padding: _padding,
          height: _containerHeight,
          width: _containerHeight,
          decoration: _boxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud,
                size: AppTheme.sizeRoundButtonIconLarge,
                color: AppTheme.colorPurple,
              ),
              _smallPadding,
              //Shows Maximum Temperature
              IconTextWidget(
                  text:
                      "${currentWeatherProvider.weatherResponse?.maxTemperature}${AppLocalizations.of(context).translate("degree_celsius")}"
                      " ${AppLocalizations.of(context).translate("maximum_temperature")}",
                  textColor: AppTheme.colorBlackPurple,
                  isMax: true),
              _smallPadding,
              //Shows Average Temperature
              IconTextWidget(
                  text:
                      "${currentWeatherProvider.averageTemperature}${AppLocalizations.of(context).translate("degree_celsius")} "
                      "${AppLocalizations.of(context).translate("average_temperature")}",
                  textColor: AppTheme.colorBlackPurple,
                  isAverage: true),
              _smallPadding,
              //Shows Average Temperature
              IconTextWidget(
                text:
                    "${currentWeatherProvider.weatherResponse?.minTemperature}${AppLocalizations.of(context).translate("degree_celsius")} "
                    "${AppLocalizations.of(context).translate("minimum_temperature")}",
                isMin: true,
                textColor: AppTheme.colorBlackPurple,
              ),
              _smallPadding,
              //Shows the day's average weather condition in a statement
              TextWidget(
                  text: "${currentWeatherProvider.weatherResponse?.weatherExpectation}",
                  fontColor: AppTheme.colorBlackPurple,
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
