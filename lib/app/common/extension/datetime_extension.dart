import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatDate() {
    String formattedDate = DateFormat("dd MMM yyyy").format(this);
    return formattedDate;
  }
}
