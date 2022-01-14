import 'package:asunnyday/routers.dart';
import 'package:asunnyday/view/screens/search/widget/search_widget.dart';
import 'package:asunnyday/view/widgets/button_widget.dart';
import 'package:asunnyday/view/widgets/loading_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/search/search_state_provider.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:asunnyday/view_model/weather/current_weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  final _padding = const EdgeInsets.all(AppTheme.paddingSmall);

  @override
  Widget build(BuildContext context) {
    final _safeAreaHeight = MediaQuery
        .of(context)
        .viewPadding
        .top;
    //This Consumer provides the state for Search Operation
    return Consumer<SearchStateProvider>(builder: (cxt, searchStateProvider, child) {
      return GestureDetector(
        //This will disable keyboard when pressed outside of the search Field
        onTap: () => searchStateProvider.searchNode.unfocus(),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: _safeAreaHeight),
              //Search Widget
              Padding(
                padding: _padding,
                //This Widget is used for searching for cities
                //based on users' query
                child: SearchWidget(
                    searchController: searchStateProvider.searchController,
                    focusNode: searchStateProvider.searchNode,
                    onCitySelected: () {
                      searchStateProvider.searchNode.unfocus();
                    }),
              ),
            ],
          ),
          floatingActionButton: Consumer<CurrentWeatherProvider>(
            builder: (cxt, currentWeatherProvider, child) {
              return ButtonWidget(
                text: AppLocalizations.of(context).translate("home_screen"),
                backgroundColor: AppTheme.colorCreamyWhite,
                textColor: AppTheme.colorBlackPurple,
                onPressed: () => Routers.showHomeScreen(cxt, replace: true),
              )
            },
          )


          ,
        ),
      );
    });
  }
}
