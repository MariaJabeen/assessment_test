import 'package:intl/intl.dart';

extension StringDateFormatter on String {
  String formatDateString() {
    final inputFormat = DateFormat('yyyy-MM-dd');
    final outputFormat = DateFormat('MMMM d, yyyy');

    final date = inputFormat.parse(this);
    final formattedDate = outputFormat.format(date);

    return formattedDate;
  }
}
