
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import '../constants/string_constant.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          StringConstants.appName,
          textStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(
              color: ColorConstants.white,
              fontWeight: FontWeight.bold),
        )
      ],
      isRepeatingAnimation: true,
      onTap: () {
        print("Tap Event");
      },
    );
  }
}
