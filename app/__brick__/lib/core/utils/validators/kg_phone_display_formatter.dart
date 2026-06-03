import 'package:flutter/services.dart';
import 'package:{{packageName}}/core/utils/validators/kg_phone_utils.dart';

/// Keeps `+996` prefix and formats the rest as `XXX XX XX XX`.
class KgPhoneDisplayFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final formatted = KgPhoneUtils.formatDisplay(newValue.text);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
