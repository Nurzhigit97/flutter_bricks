import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String formatDate({String? dateFormat, String? lang}) {
    if (this != null) {
      return DateFormat(
        dateFormat ?? 'dd.MM.yyyy',
        lang ?? 'ru',
      ).format(this!.toLocal());
    } else {
      return '';
    }
  }

  String formatDateRu({String? dateFormat, String? lang}) {
    if (this != null) {
      return DateFormat(
        dateFormat ?? 'dd.MM.yyyy',
        lang ?? 'ru',
      ).format(this!.toLocal());
    } else {
      return '';
    }
  }
}
