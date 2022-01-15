import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class Themes extends StatelessWidget {
  final String text;
  final bool left;
  final double margin;
  final double width;
  final Function toggleValue;

  const Themes(
      {Key? key,
      required this.text,
      required this.left,
      required this.margin,
      required this.width,
      required this.toggleValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: margin,
      right: left ? null : margin,
      left: left ? margin : null,
      width: width,
      height: AppTheme.sizeDefaultButton,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => toggleValue(),
        child: SizedBox(
          width: width,
          height: AppTheme.sizeSmallButton,
          child: Center(
            child: TextWidget(
              text: text,
              fontSize: AppTheme.fontSizeTTCommonsPro16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
