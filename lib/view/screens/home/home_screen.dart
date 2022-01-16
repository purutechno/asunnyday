import 'package:asunnyday/view/screens/home/widget/theme_toggler_widget.dart';
import 'package:asunnyday/view/widgets/bottom_navigation_widget.dart';
import 'package:asunnyday/view/screens/home/widget/city_and_date_widget.dart';
import 'package:asunnyday/view/screens/home/widget/weather_report_widget.dart';
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
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                //Displays The Name of City and Current Date
                CityAndDateWidget(),
                //Spacing
                Spacer(flex: 1),
                //This Widget simply changes the Theme
                ThemeTogglerWidget(initialValue: false),
                //Spacing
                Spacer(flex: 1),
                //Displays Current Weather Condition
                WeatherReportWidget(),
                //Spacing
                Spacer(flex: 4),
              ],
            ),
            const BottomNavigationWidget(
              currentScreen: CurrentScreen.home,
            )
          ],
        ),
      ),
    );
  }
}
