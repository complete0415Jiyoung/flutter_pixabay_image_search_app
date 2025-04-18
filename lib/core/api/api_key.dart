import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKey {
  static String get pixabayKey => dotenv.env['PIXABAY_KEY'] ?? '';
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
}
