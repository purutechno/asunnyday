import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class SearchSuggestionWidget extends StatelessWidget {
  final TextStyle textStyle;
  final String text;

  const SearchSuggestionWidget({Key? key, required this.textStyle, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.paddingSmall / 2),
      child: TextWidget(
        text: text,
        fontSize: textStyle.fontSize ?? AppTheme.fontSizeTTCommonsPro,
        fontFamily: textStyle.fontFamily ?? AppTheme.fontFamilyTTCommonsPro,
        fontColor: AppTheme.colorGrey,
        maxLines: 1,
      ),
    );
  }
}
