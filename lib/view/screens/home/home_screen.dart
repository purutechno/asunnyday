import 'package:asunnyday/routers.dart';
import 'package:asunnyday/view/screens/home/widget/theme_toggler.dart';
import 'package:asunnyday/view/widgets/button_widget.dart';
import 'package:asunnyday/view/screens/home/widget/city_and_date_widget.dart';
import 'package:asunnyday/view/screens/home/widget/weather_report_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //prevent the user from going back
      //at Home Screen
      onWillPop: () async => false,
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Displays The Name of City and Current Date
          CityAndDateWidget(),
          //Spacing
          const Spacer(flex: 1),
          //This Widget simply changes the Theme
          const ThemeToggler(initialValue: false),
          //Spacing
          const Spacer(flex: 1),
          //Displays Current Weather Condition
          const WeatherReportWidget(),
          //Spacing
          const Spacer(flex: 2),
          //Button Widget that navigates to Search Screen
          ButtonWidget(
              text: AppLocalizations.of(context).translate("search_for_a_city"),
              onPressed: () => Routers.showSearchScreen(context, replace: true)),
          //Bottom Padding
          const SizedBox(
            height: AppTheme.defaultPadding,
          )
        ],
      )),
    );
  }
}
