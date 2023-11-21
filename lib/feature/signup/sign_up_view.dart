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
    ref.listen<SignUpState>(signUpProvider, (previous, next) {
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign up View"),
              TextFormField(
                controller: _emailController,
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (value.length < 5) {
                    return "Name should be at least 5 character";
                  }
                  return null;
                },
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (value.length < 5) {
                    return "Name should be at least 4 character";
                  }
                  return null;
                },
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: _formKey.currentState!.validate()
                    ? () {
                        // // Burda validate degilse null yap.
                        // if (_formKey.currentState!.validate()) {
                        //   print("validate basarili");
                        //   // Burda ref.read(signUpprovider.notifier).signUpMethod cagircam
                        //
                        // }
                        ref
                            .read(signUpProvider.notifier)
                            .signUpWithEmailAndPassword(
                              _emailController.text,
                                _passwordController.text);
                      }
                    : null,
                child: Text("Sign Up"),
              )
            ],
          )),
    );
  }
}
