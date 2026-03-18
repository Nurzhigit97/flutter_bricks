import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/utils/extensions/context_extensions.dart';
import 'package:{{packageName}}/shared/utils/validators/validators.dart';

class AppValidators {
  static String? validateRequired({
    required BuildContext context,
    String? value,
  }) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return context.tr.fieldIsRequired;
    }
    return null;
  }

  static String? validateRequiredAndAllowOnlyString({
    required BuildContext context,
    String? value,
  }) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return context.tr.fieldIsRequired;
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return context.tr.mustBeString;
    }
    return null;
  }

  static String? validateNumeric({
    required BuildContext context,
    String? value,
  }) {
    if (value == null || value.isEmpty) {
      return context.tr.fieldIsRequired;
    } else if (double.tryParse(value) == null) {
      return context.tr.enterNumber;
    }
    return null;
  }

  static String? validateEmail({required BuildContext context, String? value}) {
    if (value != null && value.isNotEmpty) {
      if (!isEmailValid(value)) {
        return context.tr.unCorrectEmail;
      }
    }
    return null;
  }

  static String? passwordIsEqual({
    required BuildContext context,
    String? value,
    required String isOldPassword,
  }) {
    if (value?.isEmpty == true) {
      return 'Пожалуйста, введите пароль';
    } else if (value == isOldPassword) {
      return 'Пароли совпадают сделайте новый пароль';
    }
    return null;
  }

  static String? validateEmailIfRequired({
    required BuildContext context,
    String? value,
  }) {
    if (value == null || value.isEmpty) {
      return context.tr.fieldCantBeIsEmpty;
    } else if (isEmailValid(value) == false) {
      return context.tr.unCorrectEmail;
    }
    return null;
  }
}
