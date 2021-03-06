import 'package:asunnyday/view/widgets/theme/theme_switcher.dart';
import 'package:base/styles/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeTogglerWidget extends StatelessWidget {
  final bool initialValue;

  const ThemeTogglerWidget({Key? key, required this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (cxt, themeProvider, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.paddingSmall),
        child: ThemeSwitcher(initialValue: initialValue),
      );
    });
  }
}
