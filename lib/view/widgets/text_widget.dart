import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final bool processText;
  final bool showArticleHighlight;
  final bool showDictionaryHighlight;

  final List<String> dictionaryIgnoreTerms;
  final List<String> articleIgnoreTerms;

  const TextWidget(
    Key? key, {
    required this.text,
    this.fontColor = AppTheme.colorBlack,
    this.fontSize = AppTheme.fontSizeTTCommonsPro,
    this.fontFamily = AppTheme.fontFamilyTTCommonsPro,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.processText = true,
    this.showArticleHighlight = false,
    this.showDictionaryHighlight = false,
    this.dictionaryIgnoreTerms = const [],
    this.articleIgnoreTerms = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: fontColor,
    );

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: maxLines != 1,
      style: textStyle,
    );
  }
}
