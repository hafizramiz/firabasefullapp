import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebasefullapp/product/models/auth_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_service.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthenticationState>((ref) {
  return AuthNotifier(ref.watch(authServiceProvider));
});

// AuthenticationRepository
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthNotifier extends StateNotifier<AuthenticationState> {
  final AuthService _authService;
  late final StreamSubscription _streamSubscription;

// AuthNotifier'i cagirdiginda bunu vermem gerekiyor.
  AuthNotifier(this._authService)
      : super(const AuthenticationState.unauthenticated()) {
    _authService.user.listen((user) =>
      _onUserChanged(user)
    );
  }

  void _onUserChanged(AuthUser user) {
    if (user.isEmpty) {
      state = const AuthenticationState.unauthenticated();
    } else {
      state=AuthenticationState.authenticated(user);
    }
  }

  void onSignOut(){
    _authService.signOut();
  }

  @override
  void dispose() {
_streamSubscription.cancel();
    super.dispose();
  }

}

enum AuthenticationStatus { authenticated, unauthenticated }

// State bilgimi burda tutcam

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final AuthUser user;

  const AuthenticationState._(
      {required this.status, this.user = AuthUser.empty});

  const AuthenticationState.authenticated(AuthUser user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  // TODO: implement props
  List<Object?> get props => [status, user];
}
