import 'package:base/widgets/text_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:base/styles/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FadingText extends StatefulWidget {
 const FadingText({Key? key}) : super(key: key);
  @override
  State<FadingText> createState() => _FadingTextState();
}

class _FadingTextState extends State<FadingText> {

  double _textOpacity = 1.0;


  @override
  void initState() {
    _changeOpacity();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (cxt, themeProvider, child){
      return Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppTheme.paddingSmall,
            horizontal: AppTheme.paddingSmall),
        decoration: BoxDecoration(
            color: themeProvider.containerColor,
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusDefault),
            shape: BoxShape.rectangle,
            boxShadow: [themeProvider.boxShadow]),
        //Animates the Opacity [ Fade ]
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _textOpacity,
          child: TextWidget(
            text:
            AppLocalizations.of(context).translate("please_wait"),
            fontWeight: AppTheme.fontWeight700,
            fontFamily: AppTheme.fontFamilyButler,
            fontSize: AppTheme.fontSizeButlerMedium,
          ),
        ),
      );
    });
  }


  void _changeOpacity() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _textOpacity = _textOpacity == 0.0 ? 1.0 : 0.0;
        _changeOpacity();
      });
    });
  }
}
