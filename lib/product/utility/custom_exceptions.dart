class FirebaseCustomException implements Exception{
  final errorMessage;

  FirebaseCustomException(this.errorMessage);

  @override
  String toString() {
    return "$this $errorMessage";

  }
}


class VersionCustomException implements Exception{
  final errorMessage;

 VersionCustomException(this.errorMessage);

  @override
  String toString() {
    return "$this $errorMessage";
  }
}