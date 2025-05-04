import 'package:flutter_dotenv/flutter_dotenv.dart';

class QApiEndpoints {
  QApiEndpoints._(); // Private constructor to prevent instantiation
  
  static String? baseUrl = dotenv.env['API_BASE_URL'];
  
  }