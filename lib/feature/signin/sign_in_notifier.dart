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

  void signInWithEmailAndPassword(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true);
      await _authService.signInWithEmailAndPassword(
          email: email, password: password);
      state = state.copyWith(isLoading: false);
    } on SignInWithEMailAndPasswordException catch (error) {
      state = state.copyWith(isLoading: false);
      state = state.copyWith(error: error.errorMessage);
    }
  }
}

class SignInState extends Equatable {
  final bool? isLoading;
  final String? error;

  SignInState({this.error, this.isLoading});

  SignInState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [error, isLoading];
}
