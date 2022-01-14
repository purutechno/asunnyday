import 'package:flutter/cupertino.dart';

class SearchStateProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  @override
  void dispose() {
    searchController.dispose();
    searchNode.dispose();
    super.dispose();
  }
}
