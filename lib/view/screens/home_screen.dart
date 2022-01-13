import 'package:asunnyday/view/widgets/search_widget.dart';
import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  //Testing search widget
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchWidget(
            onCitySelected: () {},
            typeAheadController: _controller,
            focusNode: FocusNode(),
          )
        ],
      ),
    );
  }
}
