import 'package:asunnyday/view_model/home/permission_provider.dart';
import 'package:asunnyday/view_model/internationalization/app_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//This Screen displays a loading indicator and initializes the
//required values and navigates based on those values.
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
    Provider.of<PermissionProvider>(context, listen: false).initializePermissionAndNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //This widget will keep spinning until all values
    //are obtained
    return const LoadingWidget();
  }
}
