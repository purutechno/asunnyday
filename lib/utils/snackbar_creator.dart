import 'package:base/widgets/text_widget.dart';
import 'package:base/styles/app_theme.dart';
import 'package:flutter/material.dart';

class SnackBarCreator {
  static void showSnackBar(BuildContext context, String message,
      {Color color = AppTheme.colorBrownBeige, int millisecond = 700}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.fixed,
          backgroundColor: color,
          duration: Duration(milliseconds: millisecond),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: TextWidget(
                  text: message,
                  fontSize: AppTheme.fontSizeTTCommonsPro16,
                  fontWeight: AppTheme.fontWeight700,
                ),
              ),
              GestureDetector(
                  onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                  child: const Icon(
                    Icons.cancel,
                    color: AppTheme.colorWhite,
                    size: 30,
                  ))
            ],
          )),
    );
  }
}
