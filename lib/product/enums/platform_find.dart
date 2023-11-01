import 'dart:io';

enum PlatformFind {
  android,
  ios;

  static String get getversionName {
    if (Platform.isIOS) {
      PlatformFind.ios.name;
    }
    if (Platform.isAndroid) {
      return PlatformFind.android.name;
    }
    throw Exception("Platfrom unused. Please check!");
  }
}
