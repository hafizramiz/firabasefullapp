import 'package:firebasefullapp/feature/home/home_view.dart';
import 'package:firebasefullapp/feature/signin/sign_in_notifier.dart';
import 'package:firebasefullapp/feature/signup/sign_up_view.dart';
import 'package:firebasefullapp/product/widgets/error_dialog.dart';
import 'package:firebasefullapp/product/widgets/loading_dialog.dart';
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
    ref.listen<SignInState>(signInProvider, (previous, next) {
      if (next.error == null) {
        if (next.isLoading == true) {
          LoadingDialog.show(context);
        } else if (next.isLoading == false) {
          Navigator.of(context).pop();
        }
      } else {
        ErrorDialog.show(context, "${next.error}");
      }
    });

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
