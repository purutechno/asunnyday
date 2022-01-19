import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RotatingContainer extends StatefulWidget {
  const RotatingContainer({Key? key}) : super(key: key);

  @override
  State<RotatingContainer> createState() => _RotatingContainerState();
}

class _RotatingContainerState extends State<RotatingContainer>
    with SingleTickerProviderStateMixin {
  static const _height = 200.00;

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    //Rotates in Clockwise direction
    _animationController.forward();
    //Loops the rotation
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return //This Wraps the mini circle
        Consumer<ThemeProvider>(
      builder: (cxt, themeProvider, child) {
        return Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(color: themeProvider.containerColor, width: 2.0)),
          width: _height,
          margin: const EdgeInsets.symmetric(
              vertical: AppTheme.defaultPadding,
              horizontal: AppTheme.paddingSmall),
          //Rotates the Container
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            //This is the
            child: Container(
                decoration: BoxDecoration(
                    color: themeProvider.containerColor,
                    borderRadius:
                        BorderRadius.circular(AppTheme.borderRadiusDefault),
                    shape: BoxShape.rectangle,
                    boxShadow: [themeProvider.boxShadow]),
                //mini circle
                child: Container(
                  height: 10.00,
                  width: 10.00,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: themeProvider.switcherColor),
                )),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
