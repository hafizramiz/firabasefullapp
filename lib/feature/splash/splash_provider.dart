import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(SplashState());
}

class SplashState extends Equatable {
  final bool? isRequiredForceuptade;

  SplashState({this.isRequiredForceuptade});

  @override
  List<Object?> get props => [isRequiredForceuptade];

  SplashState copyWith(bool? isRequiredForceuptade) {
    return SplashState(
        isRequiredForceuptade:
            isRequiredForceuptade ?? this.isRequiredForceuptade);
  }
}
