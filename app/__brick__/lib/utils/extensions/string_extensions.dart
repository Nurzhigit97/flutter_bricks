
extension StringExtension on String {
  String toFixed({int? fractionDigits}) {
    return double.parse(this).toStringAsFixed(fractionDigits ?? 0);
  }
}

extension StringExtensions on String {
  String capitalize() {
    return isNotEmpty
        ? this[0].toUpperCase() + substring(1).toLowerCase()
        : this;
  }

  bool isNullOrEmpty() {
    return trim().isEmpty || toLowerCase() == 'null';
  }
}
