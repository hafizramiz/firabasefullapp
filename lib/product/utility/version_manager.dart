import 'package:firebasefullapp/product/utility/custom_exceptions.dart';

class VersionManager {
  final String deviceValue;
  final String databaseValue;

  VersionManager({required this.databaseValue, required this.deviceValue});

  bool isNeedUpdate() {
    final deviceNumberSplited = deviceValue.split('.').join();
    final databaseNumberSplited = databaseValue.split('.').join();

    final deviceNumber = int.tryParse(deviceNumberSplited);
    final databaseNumber = int.tryParse(databaseNumberSplited);

    if (deviceNumber == null || databaseNumber == null) {
      throw VersionCustomException(
          "$deviceNumberSplited or $databaseNumberSplited  is not valid for parse");
    }
    return deviceNumber < databaseNumber;
  }
}
