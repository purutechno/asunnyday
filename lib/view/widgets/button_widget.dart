import 'package:base/styles/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final String text;

  //Switches to reciprocal colors
  //to the current styles
  final bool toggle;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;
  final double height;
  final double? width;
  final bool showLoadingIndicator;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.fontSize = AppTheme.fontSizeButlerMedium,
    this.fontWeight = FontWeight.w600,
    this.onPressed,
    this.width,
    this.toggle = false,
    this.height = AppTheme.sizeDefaultButton,
    this.showLoadingIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Consumer<ThemeProvider>(
        builder: (cxt, themeProvider, child) {
          return TextButton(
            style: themeProvider.getButtonColor(toggle: toggle),
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
                    child: Text(
                      text,
                      style: _giveTextStyles(themeProvider),
                    )),
          );
        },
      ),
    );
  }

  TextStyle _giveTextStyles(ThemeProvider themeProvider) => TextStyle(
      fontSize: fontSize,
      fontFamily: AppTheme.fontFamilyButler,
      fontWeight: fontWeight,
      color: themeProvider.buttonTextColor(toggle: toggle));
}
