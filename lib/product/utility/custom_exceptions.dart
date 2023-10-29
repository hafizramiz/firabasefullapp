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

class SignUpWithEMailAndPasswordException implements Exception{
  final String errorMessage;
  const SignUpWithEMailAndPasswordException(this.errorMessage);
  @override
  String toString() {
    return "$this $errorMessage";
  }
}

class SignInWithEMailAndPasswordException implements Exception{
  final String errorMessage;
  const SignInWithEMailAndPasswordException(this.errorMessage);
  @override
  String toString() {
    return "$this $errorMessage";
  }
}

class ForgetPasswordException implements Exception{
  final String errorMessage;
  const ForgetPasswordException(this.errorMessage);
  @override
  String toString() {
    return "$this $errorMessage";
  }
}

class SignInWithGoogleException implements Exception{
  //final String errorMessage;
  const SignInWithGoogleException();
  @override
  String toString() {
    return "$this";
  }
}

class SignOutException implements Exception{
  final String errorMessage;
  const SignOutException(this.errorMessage);
  @override
  String toString() {
    return "$this $errorMessage";
  }
}




