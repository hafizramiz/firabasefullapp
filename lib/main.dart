import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasefullapp/feature/home/home_view.dart';
import 'package:firebasefullapp/feature/signin/sign_in_view.dart';
import 'package:firebasefullapp/feature/splash/splash_view.dart';
import 'package:firebasefullapp/product/auth/auth_notifier.dart';
import 'package:firebasefullapp/product/init/app_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'dart:math';

void main() async {
  await AppInit.initApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
final authenticateState=ref.watch(authNotifierProvider);

Widget _getHome(){
  if(authenticateState.status==AuthenticationStatus.authenticated){
    return HomeDeneme();
  }else{
    return SignInView();
  }
}

    return MaterialApp(
      home: _getHome(),
    );
  }
}

// class MyHomepage extends StatefulWidget {
//   const MyHomepage({super.key});
//
//   @override
//   State<MyHomepage> createState() => _MyHomepageState();
// }
//
// class _MyHomepageState extends State<MyHomepage> {
//   @override
//   Widget build(BuildContext context) {
//     return SplashView();
//   }
// }
