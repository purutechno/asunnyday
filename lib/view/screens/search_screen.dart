import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextWidget(text: "This is search Screen",),
    );
  }
}
