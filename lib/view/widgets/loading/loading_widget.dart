import 'package:asunnyday/view/widgets/loading/fading_text.dart';
import 'package:asunnyday/view/widgets/loading/rotating_container.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            //Flexible Spacing
            Spacer(flex: 2),
            //This container rotates in clockwise direction
            RotatingContainer(),
            //Flexible Spacing
            Spacer(flex: 2),
            //This Text fades in and out
            FadingText(),
            //Flexible Spacing
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
