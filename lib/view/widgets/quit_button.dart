import 'package:base/styles/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';

class QuitButton extends StatelessWidget {
  final ThemeProvider themeProvider;
  final Function onTapped;

  const QuitButton({Key? key, required this.onTapped, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapped(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: themeProvider.switcherColor),
        alignment: Alignment.center,
        height: AppTheme.sizeSmallButton,
        width: AppTheme.sizeSmallButton,
        child: Icon(
          Icons.close,
          color: themeProvider.containerColor,
          size: AppTheme.sizeRoundButtonIcon,
        ),
      ),
    );
  }
}
