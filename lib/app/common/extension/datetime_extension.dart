import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatDate() {
    final weekday = DateFormat('EEEE', 'en_US').format(this);
    final date = DateFormat('dd MMM yyyy').format(this);
    return '$weekday, $date';
  }
}
