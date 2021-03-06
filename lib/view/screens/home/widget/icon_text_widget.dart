import 'package:base/widgets/text_widget.dart';
import 'package:base/styles/app_theme.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String text;

  //For Max Temperature
  final bool isMax;

  //For Min Temperature
  final bool isMin;

  //For Average Temperature
  final bool isAverage;

  const IconTextWidget(
      {Key? key,
      required this.text,
      this.isMax = false,
      this.isMin = false,
      this.isAverage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
            text: text,
            fontSize: AppTheme.fontSizeTTCommonsPro,
            fontWeight: AppTheme.fontWeight700),

        const SizedBox(width: AppTheme.paddingSmall),
        //Icon for Max Temperature
        if (isMax)
          const Icon(
            Icons.wb_sunny,
            size: AppTheme.sizeRoundButtonIcon,
            color: AppTheme.colorYellow,
          ),

        //Icon for Min Temperature
        if (isMin)
          const Icon(
            Icons.ac_unit_outlined,
            size: AppTheme.sizeRoundButtonIcon,
            color: AppTheme.colorGrey,
          ),

        //Icon for Average Temperature
        if (isAverage)
          const Icon(
            Icons.height,
            size: AppTheme.sizeRoundButtonIcon,
            color: AppTheme.colorGreen,
          )
      ],
    );
  }
}
