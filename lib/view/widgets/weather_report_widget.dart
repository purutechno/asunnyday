import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class WeatherReport extends StatelessWidget {
  WeatherReport({Key? key}) : super(key: key);

  final BoxDecoration _boxDecoration =
      BoxDecoration(shape: BoxShape.circle, color: AppTheme.colorCreamyWhite, boxShadow: [AppTheme.boxShadowWhite]);
  static const _padding = EdgeInsets.all(AppTheme.defaultPadding);
  final _smallPadding = const SizedBox(height: AppTheme.paddingSmall);

  @override
  Widget build(BuildContext context) {
    final _containerHeight = MediaQuery.of(context).size.width - (2 * AppTheme.defaultPadding);
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
          TextWidget(
              text: "${AppLocalizations.of(context).translate("minimum_temperature")} : 9C",
              fontColor: AppTheme.colorBlackPurple,
              fontSize: AppTheme.fontSizeTTCommonsPro,
              fontWeight: AppTheme.fontWeight700),
          _smallPadding,
          TextWidget(
              text: "${AppLocalizations.of(context).translate("maximum_temperature")} : 9C",
              fontColor: AppTheme.colorBlackPurple,
              fontSize: AppTheme.fontSizeTTCommonsPro,
              fontWeight: AppTheme.fontWeight700),
          _smallPadding,
          TextWidget(
              text: "${AppLocalizations.of(context).translate("average_temperature")} : 9C",
              fontColor: AppTheme.colorBlackPurple,
              fontSize: AppTheme.fontSizeTTCommonsPro,
              fontWeight: AppTheme.fontWeight700),
          const SizedBox(height: AppTheme.defaultPadding),
          const TextWidget(
              text: "Mostly Cloudy",
              fontColor: AppTheme.colorPurple,
              fontFamily: AppTheme.fontFamilyButler,
              fontSize: AppTheme.fontSizeButlerMedium,
              fontWeight: AppTheme.fontWeight700),
        ],
      ),
    );
  }
}
