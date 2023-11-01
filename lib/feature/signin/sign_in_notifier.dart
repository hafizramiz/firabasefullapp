import 'package:equatable/equatable.dart';
import 'package:firebasefullapp/product/auth/auth_notifier.dart';
import 'package:firebasefullapp/product/utility/custom_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/services/auth_service.dart';

final signInProvider =
    StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  return SignInNotifier(ref.watch(authServiceProvider));
});

class SignInNotifier extends StateNotifier<SignInState> {
  final AuthService _authService;

  SignInNotifier(this._authService) : super(SignInState());

  // Burda metotlari yazcam

  void signInWithEmailAndPassword(String email, String password) {
    print("sign in yapilacak.");

    try {
      _authService.signInWithEmailAndPassword(email: email, password: password);
    } on SignInWithEMailAndPasswordException catch (error) {
      state = state.copyWith(error: error.errorMessage);
    }
  }
}

class SignInState extends Equatable {
  final String? error;

  SignInState({this.error});

  SignInState copyWith({
    String? error,
  }) {
    return SignInState(
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
