import 'package:asunnyday/routers.dart';
import 'package:asunnyday/view/widgets/button_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:base/styles/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum CurrentScreen { home, search }

class BottomNavigationWidget extends StatelessWidget {
  final CurrentScreen currentScreen;

  const BottomNavigationWidget({Key? key, required this.currentScreen}) : super(key: key);
  static const _buttonPadding = EdgeInsets.all(4);

  BoxDecoration _boxDecoration(ThemeProvider themeProvider) => BoxDecoration(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppTheme.borderRadiusDefault),
          topLeft: Radius.circular(AppTheme.borderRadiusDefault)),
      color: themeProvider.containerColor,
      boxShadow: [themeProvider.boxShadow]);

  @override
  Widget build(BuildContext context) {
    //Listening to styles
    return Consumer<ThemeProvider>(
      builder: (cxt, themeProvider, child) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppTheme.paddingSmall),
            alignment: Alignment.bottomCenter,
            height: AppTheme.sizeDefaultButton,
            decoration: _boxDecoration(themeProvider),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Home Screen button
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: _buttonPadding,
                    child: ButtonWidget(
                      //Simply toggles the theme values based on current theme
                      toggle: currentScreen == CurrentScreen.home ? false : true,
                      //Title
                      text: AppLocalizations.of(context).translate("home_screen"),
                      //GO-To search screen
                      onPressed: () => Routers.showHomeScreen(context, replace: true),
                    ),
                  ),
                ),
                //Search Screen button
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: _buttonPadding,
                    child: ButtonWidget(
                      //Simply toggles the theme values based on current theme
                      toggle: currentScreen == CurrentScreen.search ? false : true,
                      //Title
                      text: AppLocalizations.of(context).translate("search_screen"),
                      //GO-To search screen
                      onPressed: () => Routers.showSearchScreen(context, replace: true),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
