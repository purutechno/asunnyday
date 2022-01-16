import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    this.fontSize = AppTheme.fontSizeButlerMedium,
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
      child: Consumer<ThemeProvider>(
        builder: (cxt, themeProvider, child) {
          return TextButton(
            style: themeProvider.getButtonColor,
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
                    child: Consumer<ThemeProvider>(
                      builder: (cxt, themeProvider, child) {
                        //This Widget is an exception :- Text Widget doesn't support
                        //color change for Buttons
                        return Text(
                          text,
                          style: _giveTextStyles(themeProvider),
                        );
                      },
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
      color: themeProvider.buttonTextColor);
}
