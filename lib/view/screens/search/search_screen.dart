import 'package:asunnyday/view/screens/search/widget/search_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _safeAreaHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: _safeAreaHeight),
          SearchWidget(typeAheadController: typeAheadController, focusNode: focusNode, onCitySelected: onCitySelected)
        ],
      ),
    );
  }
}
