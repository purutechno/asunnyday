import 'package:asunnyday/utils/constants.dart';
import 'package:asunnyday/view/widgets/search_suggestion.dart';
import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController typeAheadController;
  final FocusNode focusNode;
  final VoidCallback onCitySelected;

  const SearchWidget({
    Key? key,
    required this.typeAheadController,
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
    final showHint = widget.typeAheadController.text.isEmpty;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.defaultPadding,
        vertical: showHint ? 8.0 : 0.0,
      ),
      decoration: BoxDecoration(
        color: AppTheme.colorWhite,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
      ),
      child: Stack(
        children: [
          if (!showHint)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextWidget(
                text: AppLocalizations.of(context).translate('search_for_a_city'),
                fontSize: AppTheme.fontSizeTTCommonsProSmall,
                fontFamily: AppTheme.fontFamilyTTCommonsPro,
                fontColor: AppTheme.colorGrey,
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: showHint ? 0.0 : AppTheme.paddingSmall),
            child: SearchWidgetConfig(
              focusNode: widget.focusNode,
              typeAheadController: widget.typeAheadController,
              textStyle: _textStyle,
              onSelected: () {
                widget.onCitySelected();
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchWidgetConfig extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController typeAheadController;
  final TextStyle textStyle;
  final VoidCallback onSelected;

  const SearchWidgetConfig({
    Key? key,
    required this.focusNode,
    required this.typeAheadController,
    required this.textStyle,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      //TODO: Get City Suggestion
      suggestionsCallback: getSuggestions,
      textFieldConfiguration: TextFieldConfiguration(
        focusNode: focusNode,
        controller: typeAheadController,
        textCapitalization: TextCapitalization.sentences,
        style: textStyle,
        onSubmitted: (_) => onSelected(),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: AppLocalizations.of(context).translate('search_for_a_city'),
          hintStyle: textStyle.copyWith(color: AppTheme.colorGrey),
        ),
      ),
      noItemsFoundBuilder: (ctx) => SearchSuggestion(
        textStyle: textStyle,
        text: AppLocalizations.of(ctx).translate('no_city_found'),
      ),
      itemBuilder: (ctx, String suggestion) => SearchSuggestion(textStyle: textStyle, text: suggestion),
      transitionBuilder: (ctx, suggestionsBox, ctrl) => suggestionsBox,
      onSuggestionSelected: (String suggestion) {
        typeAheadController.text = suggestion;
        onSelected();
      },
    );
  }

  //TODO: Get City Suggestions from the API
  Future<List<String>> getSuggestions(String query) async {
    List<String> matches = [];
    matches.addAll(Constants.supportedLanguagesCodes);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
