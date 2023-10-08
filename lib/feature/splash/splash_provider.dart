import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasefullapp/product/enums/platfrom.dart';
import 'package:firebasefullapp/product/models/version.dart';
import 'package:firebasefullapp/product/utility/firebase_collections.dart';
import 'package:firebasefullapp/product/utility/version_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final splashProvider =
    StateNotifierProvider<SplashProvider, SplashState>((ref) {
  return SplashProvider();
});

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(SplashState());

  Future<void> checkVersion() async {
    final String appVersion = await getDeviceVersion();
    print("uygulama versionu:$appVersion");
    final dbValue = await getVersionFromDb();

    if (dbValue == null || dbValue.isEmpty) {
      // Burda state'i kopyaladim yeniden state olusturdum ki Ui tarafinda dinleyiciyi uyarsin. YOksa state'i degistirince uyarmiyor.
      //ref.listen ile dinledigimde gecerlidir bu dedigim.
      state = state.copyWith(isRequiredForceuptade: true);
      return;
    }

    final checkIsNeedForceUpdate =
        VersionManager(databaseValue: dbValue, deviceValue: appVersion);

    if (checkIsNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRequiredForceuptade: true);
      return;
    }
    state = state.copyWith(isRedicertHome: true);
  }

  Future<String?> getVersionFromDb() async {
    if (kIsWeb) {
      return null;
    }

    final response = await FirebaseCollections.version.reference
        .withConverter<Version>(
            fromFirestore: ((snapshot, options) =>
                Version().fromFirestore(snapshot)),
            toFirestore: (value, options) {
              return value.toJson();
            })
        .doc(PlatformFind.getversionName)
        .get();

    return response.data()?.number;
  }

  Future<String> getDeviceVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }
}

// Burda Statelerimi tutcam
class SplashState extends Equatable {
  final bool? isRequiredForceuptade;
  final bool? isRedicertHome;

  SplashState({this.isRequiredForceuptade, this.isRedicertHome});

  @override
  List<Object?> get props => [isRequiredForceuptade, isRedicertHome];

  SplashState copyWith({bool? isRequiredForceuptade, bool? isRedicertHome}) {
    return SplashState(
        isRequiredForceuptade:
            isRequiredForceuptade ?? this.isRequiredForceuptade,
        isRedicertHome: isRedicertHome ?? this.isRedicertHome);
  }
}
