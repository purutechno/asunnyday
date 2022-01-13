import 'package:asunnyday/view/screens/home_screen.dart';
import 'package:asunnyday/view_model/internationalization/app_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    Provider.of<AppLanguageProvider>(context, listen: false).fetchLocale();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
