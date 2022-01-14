import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class WeatherReport extends StatelessWidget {
  WeatherReport({Key? key}) : super(key: key);

  final BoxDecoration _boxDecoration =
      BoxDecoration(shape: BoxShape.circle, color: AppTheme.colorCreamyWhite, boxShadow: [AppTheme.boxShadowWhite]);
  static const _padding = EdgeInsets.all(AppTheme.defaultPadding);

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
          Icon(
            Icons.cloud,
            size: AppTheme.sizeRoundButtonIconLarge,
            color: AppTheme.colorPurple,
          ),
          TextWidget(text: "9 Celcius", fontSize: AppTheme.fontSizeButlerMedium, fontWeight: AppTheme.fontWeight700),
          TextWidget(text: "9 Celcius", fontSize: AppTheme.fontSizeButlerMedium, fontWeight: AppTheme.fontWeight700),
        ],
      ),
    );
  }
}
