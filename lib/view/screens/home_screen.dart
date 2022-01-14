import 'package:asunnyday/routers.dart';
import 'package:asunnyday/view/widgets/button_widget.dart';
import 'package:asunnyday/view/widgets/city_and_date_widget.dart';
import 'package:asunnyday/view/widgets/weather_report_widget.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CurrentLocationProvider>(builder: (cxt, currentLocationProvider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Displays The Name of City
            CityAndDateWidget(currentLocationProvider: currentLocationProvider),
            const Spacer(flex: 1),
            WeatherReport(),
            const Spacer(flex: 1),
            ButtonWidget(
                text: AppLocalizations.of(context).translate("search_for_a_city"),
                textColor: AppTheme.colorBlackPurple,
                backgroundColor: AppTheme.colorCreamyWhite,
                onPressed: () => Routers.showSearchScreen(context)),
            const SizedBox(
              height: AppTheme.defaultPadding,
            )
          ],
        );
      }),
    );
  }
}
