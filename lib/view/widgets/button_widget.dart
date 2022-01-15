import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;
  final double height;
  final double? width;
  final bool showLoadingIndicator;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.fontSize = AppTheme.fontSizeTTCommonsProMedium,
    this.fontWeight = FontWeight.w600,
    this.onPressed,
    this.width,
    this.height = AppTheme.sizeDefaultButton,
    this.showLoadingIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        child: showLoadingIndicator
            ? SizedBox(
                width: fontSize,
                height: fontSize,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding),
                child: TextWidget(
                  text: text,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontFamily: AppTheme.fontFamilyTTCommonsPro,
                ),
              ),
      ),
    );
  }
}
