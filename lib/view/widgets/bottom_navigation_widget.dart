import 'package:asunnyday/routers.dart';
import 'package:asunnyday/view/widgets/button_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  BoxDecoration _boxDecoration(ThemeProvider themeProvider) => BoxDecoration(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppTheme.borderRadiusDefault),
          topLeft: Radius.circular(AppTheme.borderRadiusDefault)),
      color: themeProvider.containerColor,
      boxShadow: [themeProvider.boxShadow]);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (cxt, themeProvider, child) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding),
            alignment: Alignment.bottomCenter,
            height: AppTheme.sizeDefaultButton,
            decoration: _boxDecoration(themeProvider),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonWidget(
                  toggle: true,
                  text: AppLocalizations.of(context).translate("home_screen"),
                  onPressed: () => Routers.showHomeScreen(context, replace: true),
                ),
                ButtonWidget(
                  toggle: true,
                  text: AppLocalizations.of(context).translate("search_screen"),
                  onPressed: () => Routers.showSearchScreen(context, replace: false),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
