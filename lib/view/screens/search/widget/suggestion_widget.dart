import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';

class SuggestionWidget extends StatelessWidget {
  final ThemeProvider themeProvider;
  final TextStyle textStyle;
  final String text;

  const SuggestionWidget({Key? key, required this.textStyle, required this.text, required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeProvider.containerColor,
      padding: const EdgeInsets.all(AppTheme.paddingSmall / 2),
      child: TextWidget(
        text: text,
        fontSize: textStyle.fontSize ?? AppTheme.fontSizeTTCommonsPro,
        fontFamily: textStyle.fontFamily ?? AppTheme.fontFamilyTTCommonsPro,
        fontWeight: AppTheme.fontWeight600,
        maxLines: 1,
      ),
    );
  }
}
