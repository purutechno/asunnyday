import 'package:asunnyday/utils/snackbar_creator.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/weather/current_weather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../routers.dart';

class SearchStateProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();


  void handleNoDataCase(BuildContext cxt) {
    Provider
        .of<CurrentWeatherProvider>(cxt, listen: false)
        .weatherResponse != null
        ? () => Routers.showHomeScreen(cxt, replace: true)
        : () =>
        SnackBarCreator.showSnackBar(
            cxt, AppLocalizations.of(cxt).translate("snackBar_could_not_navigate"));
    return;
  }

  @override
  void dispose() {
    searchController.dispose();
    searchNode.dispose();
    super.dispose();
  }
}
