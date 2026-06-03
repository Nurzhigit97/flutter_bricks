/// Kyrgyzstan numbers: +996 and 9 subscriber digits.
class KgPhoneUtils {
  KgPhoneUtils._();

  /// Strips spaces, returns `+996` + up to 9 national digits.
  static String normalize(String raw) {
    var digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('996')) {
      digits = digits.substring(3);
    }
    if (digits.length > 9) {
      digits = digits.substring(0, 9);
    }
    return '+996$digits';
  }

  /// True when [normalize] yields exactly 12 digits (`996` + 9).
  static bool isComplete(String raw) {
    final d = raw.replaceAll(RegExp(r'\D'), '');
    if (d.startsWith('996')) {
      return d.length == 12;
    }
    return d.length == 9;
  }

  /// Display like `+996 505 23 11 64` (groups 3-2-2-2).
  static String formatDisplay(String raw) {
    var digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('996')) {
      digits = digits.substring(3);
    }
    if (digits.length > 9) {
      digits = digits.substring(0, 9);
    }
    const prefix = '+996';
    if (digits.isEmpty) return prefix;
    final buf = StringBuffer('$prefix ');
    for (var i = 0; i < digits.length; i++) {
      if (i == 3 || i == 5 || i == 7) buf.write(' ');
      buf.write(digits[i]);
    }
    return buf.toString();
  }
}
