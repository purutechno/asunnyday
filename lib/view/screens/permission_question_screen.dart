import 'package:asunnyday/view/widgets/button_widget.dart';
import 'package:asunnyday/view/widgets/text_widget.dart';
import 'package:asunnyday/view_model/home/permission_provider.dart';
import 'package:asunnyday/view_model/internationalization/app_localizations.dart';
import 'package:asunnyday/view_model/theme_data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PermissionQuestionScreen extends StatefulWidget {
  const PermissionQuestionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PermissionQuestionScreen> createState() => _PermissionQuestionScreenState();
}

class _PermissionQuestionScreenState extends State<PermissionQuestionScreen> {
  static const _animationDurationIn = Duration(milliseconds: 1000);
  static const _animationDurationOut = Duration(milliseconds: 500);
  static const _sizedBoxWithDefaultPadding = SizedBox(height: AppTheme.defaultPadding);
  late PermissionProvider _permissionProvider;

  Duration _duration = _animationDurationIn;
  double _scale = 0.0;
  Curve _curve = Curves.bounceOut;
  bool _closeInProgress = false;

  @override
  void initState() {
    _permissionProvider = Provider.of<PermissionProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedScale(
            duration: _duration,
            scale: _scale,
            curve: _curve,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.colorWhite,
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusDefault),
              ),
              child: Stack(
                children: [
                  //Close Button
                  Positioned(
                    top: 5.0,
                    right: 5.0,
                    child: GestureDetector(
                      onTap: () async {
                        if (!_closeInProgress) {
                          await _handleAnswer(context, false);
                        }
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        alignment: Alignment.center,
                        height: AppTheme.sizeRoundButtonBase,
                        width: AppTheme.sizeRoundButtonBase,
                        child: const Icon(
                          Icons.close,
                          size: AppTheme.sizeRoundButtonIcon,
                        ),
                      ),
                    ),
                  ),
                  //body
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(AppTheme.defaultPadding),
                    child: Column(
                      children: [
                        _sizedBoxWithDefaultPadding,
                        //For Title
                        TextWidget(
                          text: AppLocalizations.of(context).translate('activate_permission_title'),
                          fontFamily: AppTheme.fontFamilyButler,
                          fontSize: AppTheme.fontSizeButler,
                          fontColor: AppTheme.colorBlackPurple,
                          textAlign: TextAlign.center,
                        ),
                        _sizedBoxWithDefaultPadding,
                        //For Description
                        TextWidget(
                          text: AppLocalizations.of(context).translate('activate_permission_description'),
                          fontFamily: AppTheme.fontFamilyTTCommonsPro,
                          fontSize: AppTheme.fontSizeTTCommonsPro,
                          fontColor: AppTheme.colorBlackPurple,
                          textAlign: TextAlign.center,
                        ),
                        _sizedBoxWithDefaultPadding,
                        //Agree Button
                        ButtonWidget(
                          text: AppLocalizations.of(context).translate('activate'),
                          textColor: AppTheme.colorWhite,
                          backgroundColor: AppTheme.colorPurple,
                          width: AppTheme.modalButtonStandardWidth,
                          onPressed: () async {
                            if (!_closeInProgress) {
                              await _handleAnswer(context, true);
                            }
                          },
                        ),
                        _sizedBoxWithDefaultPadding,
                        //Deny Button
                        ButtonWidget(
                          text: AppLocalizations.of(context).translate('hell_no'),
                          textColor: AppTheme.colorBrownBeige,
                          width: AppTheme.modalButtonStandardWidth,
                          height: AppTheme.smallerButtonSize,
                          noBackground: true,
                          onPressed: () async {
                            if (!_closeInProgress) {
                              await _handleAnswer(context, false);
                            }
                          },
                          showLoadingIndicator: _closeInProgress,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleAnswer(
    BuildContext ctx,
    bool activateLocation,
  ) async {
    setState(() => _closeInProgress = true);
    if (activateLocation) {
      await _permissionProvider.initializePermissionAndNavigate(context);
      return;
    }
    await _navigateToNextScreen(ctx);

    if (!mounted) return;

    setState(() => _closeInProgress = false);
  }

  Future<void> _navigateToNextScreen(BuildContext ctx) async {
    setState(() {
      _duration = _animationDurationOut;
      _curve = Curves.easeIn;
      _scale = 0.0;
    });
    await Future.delayed(_duration);
    _permissionProvider.denyPermissionAndNavigate(context);
  }
}
