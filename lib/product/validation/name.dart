import 'package:formz/formz.dart';

enum NameValidationError { invalid, empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure([super.value = '']) : super.pure();

  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) {
      return NameValidationError.empty;
    } else if (value.length < 4) {
      return NameValidationError.invalid;
    }
    return null;
  }

  static String? showNameErrorMessage(NameValidationError? error) {
    if (error == NameValidationError.empty) {
      return "Empty Name";
    } else if (error == NameValidationError.invalid) {
      return "Invalid Name";
    } else {
      return null;
    }
  }
}
