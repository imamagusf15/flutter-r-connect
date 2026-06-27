import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatDateAndDay() {
    final weekday = DateFormat('EEEE', 'en_US').format(this);
    final date = DateFormat('dd MMM yyyy').format(this);
    return '$weekday, $date';
  }

  String formatDate() {
    final date = DateFormat('dd MMMM yyyy').format(this);
    return date;
  }
}
