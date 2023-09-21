import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebasefullapp/product/constants/color_constant.dart';
import 'package:firebasefullapp/product/constants/string_constant.dart';
import 'package:firebasefullapp/product/enums/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/widgets/animated_text.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConstants.appIcon.toImage,
            AnimatedTextWidget(),
          ],
        ),
      ),
    );
  }
}
