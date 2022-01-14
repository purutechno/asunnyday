import 'package:asunnyday/view/screens/search/widget/search_widget.dart';
import 'package:asunnyday/view_model/search/search_state_provider.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class SearchSuggestionWidget extends StatelessWidget {
  final SearchStateProvider searchStateProvider;

  const SearchSuggestionWidget({Key? key, required this.searchStateProvider}) : super(key: key);

  final _padding = const EdgeInsets.all(AppTheme.paddingSmall);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: _padding,
          child: SearchWidget(
              searchController: searchStateProvider.searchController,
              focusNode: searchStateProvider.searchNode,
              onCitySelected: () {}),
        )
      ],
    );
  }
}
