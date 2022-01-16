import 'package:asunnyday/utils/date_time_formatter.dart';
import 'package:asunnyday/utils/null_replacer.dart';
import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityAndDateWidget extends StatelessWidget {
  const CityAndDateWidget({Key? key}) : super(key: key);

  // BorderRadius for info container
  static const _borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(AppTheme.borderRadiusDefault),
      bottomRight: Radius.circular(AppTheme.borderRadiusDefault));

  // Padding for info container
  EdgeInsets _padding(double safeAreHeight) => EdgeInsets.only(
      bottom: AppTheme.defaultPadding,
      left: AppTheme.paddingSmall,
      right: AppTheme.paddingSmall,
      top: safeAreHeight);

  static const _margin = EdgeInsets.symmetric(horizontal: AppTheme.paddingSmall);

  // Decoration for info container
  BoxDecoration _boxDecoration(ThemeProvider themeProvider) => BoxDecoration(
        borderRadius: _borderRadius,
        color: themeProvider.containerColor,
        boxShadow: [themeProvider.boxShadow],
      );

  @override
  Widget build(BuildContext context) {
    final _safeAreaHeight = MediaQuery.of(context).viewPadding.top;
    return Consumer2<ThemeProvider, CurrentLocationProvider>(
        builder: (cxt, themeProvider, currentLocationProvider, child) {
      return Column(
        children: [
          //Painting the safeArea with creamyWhite color
          Container(
            height: _safeAreaHeight,
            color: themeProvider.containerColor,
          ),
          Container(
            padding: _padding(_safeAreaHeight),
            margin: _margin,
            alignment: Alignment.bottomCenter,
            decoration: _boxDecoration(themeProvider),
            child: Column(
              children: [
                //City Name
                TextWidget(
                  text: currentLocationProvider.cityResponse?.cityName ?? NullReplacer.cityName,
                  fontSize: AppTheme.fontSizeButler,
                  fontFamily: AppTheme.fontFamilyButler,
                ),
                const SizedBox(height: AppTheme.paddingSmall),
                //Current Date
                TextWidget(
                  text: DateTimeFormatter.formatCurrentDate(),
                  fontSize: AppTheme.fontSizeButler,
                  fontFamily: AppTheme.fontFamilyButler,
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
