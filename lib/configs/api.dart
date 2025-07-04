import 'package:intl/intl.dart';

const API_KEY = '2e0f2a25d5974f778a1742f9e89b0e60';
const API_HOST = 'https://newsapi.org/v2/everything';

final DateTime oneMonthAgo = DateTime(
  DateTime.now().year,
  DateTime.now().month - 1,
  DateTime.now().day,
);

final String today = DateFormat('yyyy-MM-dd').format(oneMonthAgo);

String formatDate(String date) {
  final parsedDate = DateTime.parse(date);
  return DateFormat('dd MMMM yyyy').format(parsedDate);
}
