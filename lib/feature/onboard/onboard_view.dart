import 'package:firebasefullapp/feature/home/home_view.dart';
import 'package:firebasefullapp/feature/signin/sign_in_view.dart';
import 'package:firebasefullapp/product/auth/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardView extends ConsumerWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authenticateState= ref.watch(authNotifierProvider);
print(authenticateState.status);
    if(authenticateState.status==AuthenticationStatus.authenticated){
      return HomeDeneme();
    }else{
      return SignInView();
    }
  }
}
