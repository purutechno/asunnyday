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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [TextWidget( text: AppLocalizations.of(context).translate("welcome"))],
      ),
    );
  }
}
