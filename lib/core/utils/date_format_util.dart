import 'package:intl/intl.dart';

class DateFormatUtil {
  DateFormatUtil._();

  static String formatFullDate(DateTime? date) {
    if (date == null) return '';

    final formattedDate = DateFormat('E, d MMMM yyyy').format(date);

    return formattedDate; // Output: Tue, 14 March 2026
  }

  static String getTimeOnly(DateTime? date) {
    if (date == null) return '';

    final localDate = date.toLocal();

    String timeOnly =
        "${localDate.hour.toString().padLeft(2, '0')}:"
        "${localDate.minute.toString().padLeft(2, '0')}";

    return timeOnly; // Output : 09:30
  }
}
