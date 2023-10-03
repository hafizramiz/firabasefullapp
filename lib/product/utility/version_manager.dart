import 'package:firebasefullapp/product/utility/custom_exceptions.dart';

class VersionManager {
  final String deviceValue;
  final String databaseValue;

  VersionManager({required this.databaseValue, required this.deviceValue});

  bool isNeedUpdate() {
    final deviceNumberSplited = deviceValue.split('.').join();
    final databseNumberSplited = deviceValue.split('.').join();

    final deviceNumber = int.tryParse(deviceNumberSplited);
    final databaseNumber = int.tryParse(databseNumberSplited);

    if (deviceNumber == null || databaseNumber == null) {
      throw VersionCustomException(
          "$deviceNumberSplited or $databseNumberSplited  is not valid for parse");
    }
    return deviceNumber < databaseNumber;
  }
}
