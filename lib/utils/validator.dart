import 'package:news_app/utils/styles/resources.dart';

class Validator {
  Validator();

  String email(String value) {
    const String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final RegExp regex = RegExp(pattern);
    final msg = notEmpty(value, Resources.hintTextEmail);
    if (msg.isNotEmpty) {
      return msg;
    } else if (!regex.hasMatch(value)) {
      return Resources.errMsgInvalidEmail;
    } else {
      return '';
    }
  }

  String notEmpty(String value, String fieldName) {
    if (value.toString().trim().isEmpty) {
      return '$fieldName ${Resources.isRequired}';
    } else {
      return '';
    }
  }
}
