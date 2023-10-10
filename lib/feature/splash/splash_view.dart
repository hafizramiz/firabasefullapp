import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebasefullapp/feature/home/home_view.dart';
import 'package:firebasefullapp/feature/splash/splash_provider.dart';
import 'package:firebasefullapp/product/constants/color_constant.dart';
import 'package:firebasefullapp/product/constants/string_constant.dart';
import 'package:firebasefullapp/product/enums/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../product/widgets/animated_text.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with _MixinSplashViewListen {
  @override
  void initState() {
    ref.read(splashProvider.notifier).checkVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listen();

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

// Listeni burda yap okunurlugu artirsin

mixin _MixinSplashViewListen on ConsumerState<SplashView> {

  void listen() {
    ref.listen(splashProvider, (previous, next) {
      if (next.isRequiredForceuptade ?? false) {
        print("next.isRequiredForceuptade: ${next.isRequiredForceuptade}");

        showAboutDialog(context: context);
        return;
      }

      if (next.isRedicertHome != null) {
        if (next.isRedicertHome!) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
          );
        } else {}
      }
    });
  }
}
