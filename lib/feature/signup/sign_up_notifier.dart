import 'package:equatable/equatable.dart';
import 'package:firebasefullapp/product/auth/auth_notifier.dart';
import 'package:firebasefullapp/product/services/auth_service.dart';
import 'package:firebasefullapp/product/utility/custom_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpState>((ref) {
  return SignUpNotifier(ref.watch(authServiceProvider));
});


class SignUpNotifier extends StateNotifier<SignUpState> {
  final AuthService _authService;

  SignUpNotifier(this._authService) : super(SignUpState());

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      state=state.copyWith(isLoading: true);
      await _authService.signUpWithEmailAndPassword(
          email: email, password: password);
      state=state.copyWith(isLoading: false);
    } on SignUpWithEMailAndPasswordException catch (error) {
      state = state.copyWith(error: error.errorMessage);
    }
  }
}


// Burda state bilgimi tutcam.
class SignUpState extends Equatable {
  final bool? isLoading;
  final String? error;

  SignUpState({this.error,this.isLoading});

  SignUpState copyWith({String? error, bool? isLoading}) {
    return SignUpState(error: error ?? this.error,isLoading: isLoading?? this.isLoading);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading,error];
}
