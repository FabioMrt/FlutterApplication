import 'package:flutter_application_1/domain/form_validation/input_validator.dart';

String? validateForm(String? value, ValidationMethod method) {
  InputValidator _validator = InputValidator();

  return _validator.validate(value, method);
}
