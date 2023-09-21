class FirebaseCustomException implements Exception{
  final errorMessage;

  FirebaseCustomException(this.errorMessage);

  @override
  String toString() {
    return "$this $errorMessage";

  }
}