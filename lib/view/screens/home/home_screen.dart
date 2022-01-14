import 'package:asunnyday/routers.dart';
import 'package:asunnyday/view/widgets/button_widget.dart';
import 'package:asunnyday/view/screens/home/widget/city_and_date_widget.dart';
import 'package:asunnyday/view/widgets/weather_report_widget.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Displays The Name of City and Current Date
          CityAndDateWidget(),
          //Spacing
          const Spacer(flex: 1),
          //Displays Current Weather Condition
          WeatherReportWidget(),
          //Spacing
          const Spacer(flex: 1),
          //Button Widget that navigates to Search Screen
          ButtonWidget(
              text: AppLocalizations.of(context).translate("search_for_a_city"),
              textColor: AppTheme.colorBlackPurple,
              backgroundColor: AppTheme.colorCreamyWhite,
              onPressed: () => Routers.showSearchScreen(context)),
          //Bottom Padding
          const SizedBox(
            height: AppTheme.defaultPadding,
          )
        ],
      )
    );
  }
}
