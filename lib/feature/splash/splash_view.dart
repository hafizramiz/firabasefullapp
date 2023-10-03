import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebasefullapp/feature/splash/splash_provider.dart';
import 'package:firebasefullapp/product/constants/color_constant.dart';
import 'package:firebasefullapp/product/constants/string_constant.dart';
import 'package:firebasefullapp/product/enums/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/widgets/animated_text.dart';


final splashProvider =
StateNotifierProvider<SplashProvider, SplashState>((ref) {
  return SplashProvider();
});


class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {

  @override
  Widget build(BuildContext context) {
    ref.listen(splashProvider, (previous, next) {

      if(next.isRequiredForceuptade ?? false){
        print("Calisti");
        showAboutDialog(context: context);
        return;
      }

      if(next.isRedicertHome !=null){
       if(next.isRedicertHome!){
         // true
       }else{
         // false
       }
      }

    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConstants.appIcon.toImage,
            AnimatedTextWidget(),
          ],
        ),
      ),
    );
  }
}
