import 'package:asunnyday/utils/date_time_formatter.dart';
import 'package:asunnyday/utils/null_replacer.dart';
import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityAndDateWidget extends StatelessWidget {
  CityAndDateWidget({Key? key}) : super(key: key);

  // BorderRadius for info container
  static const _borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(AppTheme.borderRadiusDefault),
      bottomRight: Radius.circular(AppTheme.borderRadiusDefault));

  // Padding for info container
  EdgeInsets _padding(double safeAreHeight) => EdgeInsets.only(
      bottom: AppTheme.defaultPadding,
      left: AppTheme.defaultPadding,
      right: AppTheme.defaultPadding,
      top: safeAreHeight);

  // Decoration for info container
  final BoxDecoration _boxDecoration = BoxDecoration(
    borderRadius: _borderRadius,
    color: AppTheme.colorCreamyWhite,
    boxShadow: [AppTheme.boxShadowDefault],
  );

  @override
  Widget build(BuildContext context) {
    final _safeAreaHeight = MediaQuery.of(context).viewPadding.top;
    return Consumer<CurrentLocationProvider>(builder: (cxt, currentLocationProvider, child) {
      return Column(
        children: [
          //Painting the safeArea with creamyWhite color
          Container(
            height: _safeAreaHeight,
            color: AppTheme.colorCreamyWhite,
          ),
          Container(
            padding: _padding(_safeAreaHeight),
            alignment: Alignment.bottomCenter,
            decoration: _boxDecoration,
            child: Column(
              children: [
                //City Name
                TextWidget(
                  text: currentLocationProvider.cityResponse?.cityName ?? NullReplacer.cityName,
                  fontSize: AppTheme.fontSizeButler,
                  fontFamily: AppTheme.fontFamilyButler,
                  fontColor: AppTheme.colorBlackPurple,
                ),
                const SizedBox(height: AppTheme.paddingSmall),
                //Current Date
                TextWidget(
                  text: DateTimeFormatter.formatCurrentDate(),
                  fontSize: AppTheme.fontSizeButler,
                  fontFamily: AppTheme.fontFamilyButler,
                  fontColor: AppTheme.colorBlackPurple,
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
