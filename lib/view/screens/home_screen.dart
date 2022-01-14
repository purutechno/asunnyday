import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/home/current_location_provider.dart';
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
        return TextWidget(
            text:
                "Latitude is ${currentLocationProvider.position?.latitude} Longitude is ${currentLocationProvider.position?.longitude} and City is ${currentLocationProvider.cityResponse?.cityName}");
      }),
    );
  }
}
