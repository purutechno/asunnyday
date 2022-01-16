import 'package:asunnyday/routers.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';
import 'button_widget.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
            text: AppLocalizations.of(context).translate("home_screen"),
            onPressed: () => Routers.showHomeScreen(context, replace: true),
          ),
          ButtonWidget(
            text: AppLocalizations.of(context).translate("search_for_a_city"),
            onPressed: () => Routers.showSearchScreen(context, replace: false),
          )
        ],
      ),
    );
  }
}
