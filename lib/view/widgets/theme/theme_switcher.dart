import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view/widgets/theme/themes.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:asunnyday/view_model/theme_data/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  final String falseText;
  final String trueText;
  final bool initialValue;

  const ThemeSwitcher({
    Key? key,
    required this.falseText,
    required this.trueText,
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
            borderRadius: BorderRadius.circular(AppTheme.sizeMediumButton / 2),
          ),
          child: Stack(
            children: [
              //The Toggler
              Themes(
                  margin: margin,
                  width: buttonWidth,
                  text: widget.falseText,
                  left: false,
                  toggleValue: () => _toggleValue(themeProvider)),
              //The Toggler
              Themes(
                  margin: margin,
                  width: buttonWidth,
                  text: widget.trueText,
                  left: true,
                  toggleValue: () => _toggleValue(themeProvider)),
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
                      borderRadius: BorderRadius.circular(AppTheme.sizeSmallButton / 2),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: toggleValue ? widget.trueText : widget.falseText,
                        fontSize: AppTheme.fontSizeTTCommonsPro16,
                        fontWeight: FontWeight.bold,
                      ),
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
    themeProvider.toggleTheme();
    setState(() => toggleValue = !toggleValue);
  }
}
