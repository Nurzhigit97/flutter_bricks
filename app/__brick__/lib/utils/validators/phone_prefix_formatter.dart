import 'package:flutter/services.dart';

class PhonePrefixFormatter extends TextInputFormatter {
  final String prefix;

  PhonePrefixFormatter(this.prefix);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (!newValue.text.startsWith(prefix)) {
      final fallbackOffset = oldValue.selection.baseOffset.clamp(
        prefix.length,
        oldValue.text.length,
      );
      return oldValue.copyWith(
        selection: TextSelection.collapsed(offset: fallbackOffset),
      );
    }

    final digitsOnly = newValue.text
        .substring(prefix.length)
        .replaceAll(RegExp(r'\D'), '');
    final formatted = '$prefix$digitsOnly';
    final safeOffset = newValue.selection.baseOffset.clamp(
      prefix.length,
      formatted.length,
    );

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: safeOffset),
    );
  }
}
