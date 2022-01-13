import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;
  final double height;
  final double? width;
  final bool noBackground;
  final bool showLoadingIndicator;

  final double textPadding;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.backgroundColor = AppTheme.colorPink,
    this.textColor = AppTheme.colorPurple,
    this.fontSize = AppTheme.fontSizeTTCommonsProMedium,
    this.fontWeight = FontWeight.bold,
    this.onPressed,
    this.width,
    this.height = AppTheme.sizeDefaultButton,
    this.noBackground = false,
    this.showLoadingIndicator = false,
    this.textPadding = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(horizontal: textPadding);
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: onPressed == null ? backgroundColor.withOpacity(AppTheme.disabledOpacity) : backgroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: _buildText(),
      ),
    );
  }


  Widget _buildText() {
    if (showLoadingIndicator) {
      return SizedBox(
        width: fontSize,
        height: fontSize,
        child: CircularProgressIndicator(
          color: textColor,
          value: null,
          strokeWidth: 2.0,
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding),
      child: TextWidget(
        text: text,
        fontColor: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: AppTheme.fontFamilyTTCommonsPro,
      ),
    );
  }
}
