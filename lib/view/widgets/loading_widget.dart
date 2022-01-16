import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  static const _height = 100.00;

  BoxDecoration _boxDecoration(ThemeProvider themeProvider) =>
      BoxDecoration(color: themeProvider.containerColor, shape: BoxShape.circle, boxShadow: [themeProvider.boxShadow]);
  static const _padding = EdgeInsets.symmetric(vertical: AppTheme.defaultPadding, horizontal: AppTheme.paddingSmall);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThemeProvider>(
        builder: (cxt, themeProvider, child) {
          return Center(
            child: Container(
              width: _height,
              margin: _padding,
              decoration: _boxDecoration(themeProvider),
              child: CircularProgressIndicator(
                backgroundColor: themeProvider.containerColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
