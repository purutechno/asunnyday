import 'package:asunnyday/view/widgets/theme/themes.dart';
import 'package:base/styles/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  final bool initialValue;

  const ThemeSwitcher({
    Key? key,
    this.initialValue = false,
  }) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  late bool toggleValue = false;

  @override
  void initState() {
    super.initState();
    toggleValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final fullWidth = constraints.maxWidth;
      const margin = (AppTheme.sizeMediumButton - AppTheme.sizeSmallButton) / 2;
      final buttonWidth = (fullWidth / 2) - margin;
      return Consumer<ThemeProvider>(builder: (cxt, themeProvider, child) {
        return Container(
          height: AppTheme.sizeMediumButton,
          width: fullWidth,
          decoration: BoxDecoration(
            color: themeProvider.containerColor,
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusDefault),
          ),
          child: Stack(
            children: [
              //The Toggler
              Themes(margin: margin, width: buttonWidth, left: false, toggleValue: () => _toggleValue(themeProvider)),
              //The Toggler
              Themes(margin: margin, width: buttonWidth, left: true, toggleValue: () => _toggleValue(themeProvider)),
              //Animated Shifter
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                top: margin,
                left: toggleValue ? margin : margin + buttonWidth,
                child: GestureDetector(
                  onTap: () => _toggleValue(themeProvider),
                  child: Container(
                    width: buttonWidth,
                    height: AppTheme.sizeSmallButton,
                    decoration: BoxDecoration(
                      //color based on theme
                      color: themeProvider.switcherColor,
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusDefault),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
    });
  }

  void _toggleValue(ThemeProvider themeProvider) {
    //Switching styles
    themeProvider.toggleTheme();
    setState(() => toggleValue = !toggleValue);
  }
}
