import 'package:asunnyday/view/widgets/theme/theme_switcher.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeToggler extends StatelessWidget {
  final bool initialValue;

  const ThemeToggler({Key? key, required this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (cxt, themeProvider, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding),
        child: ThemeSwitcher(
            falseText: AppLocalizations.of(cxt).translate("light_theme"),
            trueText: AppLocalizations.of(cxt).translate("dark_theme"),
            initialValue: initialValue),
      );
    });
  }
}
