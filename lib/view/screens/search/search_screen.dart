import 'package:asunnyday/utils/snackbar_creator.dart';
import 'package:asunnyday/view/screens/search/widget/search_widget.dart';
import 'package:asunnyday/view/widgets/bottom_navigation_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/search/search_state_provider.dart';
import 'package:base/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//This Screen is capable of displaying suggestions based
//on users' searched values.
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  final _padding = const EdgeInsets.all(AppTheme.paddingSmall);

  @override
  Widget build(BuildContext context) {
    final _safeAreaHeight = MediaQuery.of(context).viewPadding.top;
    //This Consumer provides the state for Search Operation
    return WillPopScope(
      //prevent the user from going back
      //at Home Screen
      onWillPop: () async => false,
      child: Consumer<SearchStateProvider>(builder: (cxt, searchStateProvider, child) {
        return GestureDetector(
          //This will disable keyboard when pressed outside of the search Field
          onTap: () => searchStateProvider.searchNode.unfocus(),
          child: Scaffold(
            body: Stack(
              children: [
                Column(
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
                            SnackBarCreator.showSnackBar(context, AppLocalizations.of(context).translate("please_wait"),
                                millisecond: 200);
                          }),
                    ),
                  ],
                ),
                //This Widget Switches between home and search screen
                const BottomNavigationWidget(
                  //This is the current Screen
                  currentScreen: CurrentScreen.search,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
