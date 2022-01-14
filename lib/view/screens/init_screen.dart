import 'package:asunnyday/view/screens/home/home_screen.dart';
import 'package:asunnyday/view/screens/search/search_screen.dart';
import 'package:asunnyday/view_model/home/permission_provider.dart';
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
    //Takes care of location permission , location initialization and navigation
/*    Provider.of<PermissionProvider>(context, listen: false).initializePermissionAndNavigate(context);*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Implement Splash Screen 1
    return const SearchScreen();
  }
}
