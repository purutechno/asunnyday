import 'package:base/styles/app_theme.dart';
import 'package:flutter/material.dart';

class Themes extends StatelessWidget {
  final bool left;
  final double margin;
  final double width;
  final Function toggleValue;

  const Themes(
      {Key? key,
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
        ),
      ),
    );
  }
}
