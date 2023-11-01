import 'package:firebasefullapp/feature/home/home_view.dart';
import 'package:firebasefullapp/feature/signin/sign_in_notifier.dart';
import 'package:firebasefullapp/feature/signup/sign_up_notifier.dart';
import 'package:firebasefullapp/product/auth/auth_notifier.dart';
import 'package:firebasefullapp/product/widgets/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/widgets/error_dialog.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<SignUpState>(signUpProvider, (previous, current) {
      if (current.isLoading == true) {
        // Loading sheer goster
      } else if (current.isLoading == false) {
        Navigator.of(context).pop();
      } else if (current.error != null) {
        // ErrorDialog.show(context).
      }
    });
    return Scaffold(
      body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign up View"),
              TextFormField(
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                  ),
              TextFormField(
                controller: _emailController,
              ),
              TextFormField(
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: () async {
                  // // Burda validate degilse null yap.
                  // if (_formKey.currentState!.validate()) {
                  //   print("validate basarili");
                  //   // Burda ref.read(signUpprovider.notifier).signUpMethod cagircam
                  //
                  // }
                  //  await ref.read(signUpProvider.notifier).signUpWithEmailAndPassword(
                  //     _emailController.text, _passwordController.text);
                  //ErrorDialog.show(context,"Example Error");
                  LoadingDialog.show(context);
                  print("Sign up yapildi mi?");
                },
                child: Text("Sign Up"),
              )
            ],
          )),
    );
  }
}
