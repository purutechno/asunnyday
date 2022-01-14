import 'package:asunnyday/view/screens/search/widget/search_suggestion_widget.dart';
import 'package:asunnyday/view_model/search/search_state_provider.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _safeAreaHeight = MediaQuery.of(context).viewPadding.top;
    return Consumer<SearchStateProvider>(builder: (cxt, searchStateProvider, child) {
      return GestureDetector(
        onTap: () => searchStateProvider.searchNode.unfocus(),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: _safeAreaHeight),
              SearchSuggestionWidget(searchStateProvider: searchStateProvider),
            ],
          ),
        ),
      );
    });
  }
}
