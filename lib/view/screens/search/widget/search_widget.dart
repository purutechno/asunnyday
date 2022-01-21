import 'package:asunnyday/view/screens/search/widget/suggestion_widget.dart';
import 'package:base/widgets/text_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/search/multi_city_provider.dart';
import 'package:base/styles/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController searchController;
  final FocusNode focusNode;
  final VoidCallback onCitySelected;

  const SearchWidget({
    Key? key,
    required this.searchController,
    required this.focusNode,
    required this.onCitySelected,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  static const _textStyle = TextStyle(
    fontSize: AppTheme.fontSizeTTCommonsPro,
    fontFamily: AppTheme.fontFamilyTTCommonsPro,
  );

  @override
  Widget build(BuildContext context) {
    final showHint = widget.searchController.text.isEmpty;
    return Consumer<ThemeProvider>(builder: (cxt, themeProvider, child) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppTheme.defaultPadding,
          vertical: showHint ? 8.0 : 0.0,
        ),
        decoration: BoxDecoration(
          color: themeProvider.containerColor,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
        ),
        child: Stack(
          children: [
            //Shows Hint when text is Empty
            if (!showHint)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextWidget(
                  text: AppLocalizations.of(context).translate('search_for_a_city'),
                  fontSize: AppTheme.fontSizeTTCommonsProSmall,
                  fontFamily: AppTheme.fontFamilyTTCommonsPro,
                ),
              ),
            //This Widget Generates Suggestions
            Padding(
              padding: EdgeInsets.only(top: showHint ? 0.0 : AppTheme.paddingSmall),
              child: SearchWidgetConfig(
                focusNode: widget.focusNode,
                searchController: widget.searchController,
                textStyle: _textStyle,
                onSelected: () {
                  widget.onCitySelected();
                  setState(() {});
                },
                themeProvider: themeProvider,
              ),
            ),
          ],
        ),
      );
    });
  }
}

//This Widget generates suggestions for cities
class SearchWidgetConfig extends StatelessWidget {
  final ThemeProvider themeProvider;
  final FocusNode focusNode;
  final TextEditingController searchController;
  final TextStyle textStyle;
  final VoidCallback onSelected;

  const SearchWidgetConfig(
      {Key? key,
      required this.focusNode,
      required this.searchController,
      required this.textStyle,
      required this.onSelected,
      required this.themeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Using a TypeAhead library to display suggestions
    //For more info, visit :- https://pub.dev/packages/flutter_typeahead
    return Consumer<MultiCityProvider>(
      builder: (cxt, multiCityProvider, child) {
        return TypeAheadFormField(
          //Getting response based on query
          suggestionsCallback: (query) => getSuggestions(query, multiCityProvider),
          textFieldConfiguration: TextFieldConfiguration(
            focusNode: focusNode,
            controller: searchController,
            textCapitalization: TextCapitalization.sentences,
            style: textStyle.copyWith(fontWeight: AppTheme.fontWeight600, color: themeProvider.searchFieldColor),
            onSubmitted: (_) => onSelected(),
            //Decoration for the search config widget
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: AppLocalizations.of(context).translate('search_for_a_city'),
              hintStyle: textStyle.copyWith(
                  color: themeProvider.switcherColor,
                  fontWeight: AppTheme.fontWeight600,
                  fontFamily: AppTheme.fontFamilyButler),
            ),
          ),
          noItemsFoundBuilder: (ctx) => SuggestionWidget(
            themeProvider: themeProvider,
            textStyle: textStyle,
            text: AppLocalizations.of(ctx).translate('no_city_found'),
          ),
          //Builds The suggestions in Real Time when user enters some alphabets
          itemBuilder: (ctx, String suggestion) =>
              SuggestionWidget(themeProvider: themeProvider, textStyle: textStyle, text: suggestion),
          transitionBuilder: (ctx, suggestionsBox, ctrl) => suggestionsBox,
          //This method is triggered when a suggestion is clicked
          onSuggestionSelected: (String suggestion) async {
            searchController.text = suggestion;
            onSelected();
            multiCityProvider.onSuggestionCallback(suggestion);
            await multiCityProvider.getWeatherAndNavigate(cxt,
                locationKey: multiCityProvider.selectedCity?.locationKey,
                cityName: multiCityProvider.selectedCity?.cityName);
          },
        );
      },
    );
  }

  //This function generates suggestions based on users' query
  Future<List<String>> getSuggestions(String query, MultiCityProvider multiCityProvider) async {
    multiCityProvider.getMultipleCities(query);
    List<String> matches = [];
    //TODO: Find a way to make less API calls
    matches.addAll(multiCityProvider.cityNAmes);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
