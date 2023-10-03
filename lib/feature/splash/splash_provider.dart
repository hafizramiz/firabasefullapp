import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super( SplashState());


  void checkVersion(String appVersion){

  }

}


class SplashState extends Equatable {
  final bool? isRequiredForceuptade;
  final bool? isRedicertHome;

  SplashState(  {this.isRequiredForceuptade, this.isRedicertHome});

  @override
  List<Object?> get props => [isRequiredForceuptade, isRedicertHome];

  SplashState copyWith({ bool? isRequiredForceuptade}) {
    return SplashState(
        isRequiredForceuptade:
            isRequiredForceuptade ?? this.isRequiredForceuptade,
        isRedicertHome:isRedicertHome?? this.isRedicertHome
    );
  }
}
