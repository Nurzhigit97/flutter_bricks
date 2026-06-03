import 'package:intl/intl.dart';

abstract final class MoneyFormatter {
  static final _formatter = NumberFormat('#,##0.##', 'ru');

  static String formatSom(num value, {bool showDecimals = true}) {
    if (!showDecimals && value == value.roundToDouble()) {
      return '${NumberFormat('#,##0', 'ru').format(value)} с';
    }
    return '${_formatter.format(value)} с';
  }

  static String formatSignedSom(int amount, {required bool isIncome}) {
    final prefix = isIncome ? '+' : '-';
    return '$prefix${formatSom(amount.abs())}';
  }
}
