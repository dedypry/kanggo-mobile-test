import 'package:intl/intl.dart';

const API_KEY = '1b3150f855b64133aaa13266cf111f46';
const API_HOST = 'https://newsapi.org/v2/everything';

final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

String formatDate(String date) {
  final parsedDate = DateTime.parse(date);
  return DateFormat('dd MMMM yyyy').format(parsedDate);
}
