import 'package:firebasefullapp/feature/home/home_view.dart';
import 'package:firebasefullapp/feature/signin/sign_in_notifier.dart';
import 'package:firebasefullapp/feature/signup/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInProvider);
    return Scaffold(
      body: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign In Page"),
          TextFormField(
            controller: emailController,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              print("Validate ise botun tiklansin");
              ref.read(signInProvider.notifier).signInWithEmailAndPassword(
                  emailController.text, passwordController.text);
            },
            child: Text("Sign In"),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpView()));
              },
              child: Text("Sign Up"))
        ],
      )),
    );
  }
}
