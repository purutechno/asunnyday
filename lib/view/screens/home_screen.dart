import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/internationalization/app_language.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<AppLanguageProvider>(context, listen: false).fetchLocale();
    // TODO: implement initState
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
