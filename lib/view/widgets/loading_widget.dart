import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({Key? key}) : super(key: key);

  static const _height = 100.00;
  final BoxDecoration _boxDecoration =
      BoxDecoration(color: AppTheme.colorCreamyWhite, shape: BoxShape.circle, boxShadow: [AppTheme.boxShadowWhite]);
  static const _padding = EdgeInsets.symmetric(vertical: AppTheme.defaultPadding, horizontal: AppTheme.paddingSmall);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: _height,
          margin: _padding,
          decoration: _boxDecoration,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
