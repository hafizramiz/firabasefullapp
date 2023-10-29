
import 'package:equatable/equatable.dart';
import 'package:firebasefullapp/product/utility/custom_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/auth/auth_notifier.dart';
import '../../product/services/auth_service.dart';

final homeProvider =
StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref.watch(authServiceProvider));
});

class HomeNotifier extends StateNotifier<HomeState> {
  final AuthService _authService;

  HomeNotifier(this._authService) : super(HomeState());

  // Burda metotlari yazcam

  void signOut() {
    print("sign out yapilacak.");
    try {
      _authService.signOut();
    } on SignOutException catch (error) {
      state = state.copyWith(error: error.errorMessage);
    }
  }
}

class HomeState extends Equatable {
  final String? error;

  HomeState({this.error});

  HomeState copyWith({
    String? error,
  }) {
    return HomeState(
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
