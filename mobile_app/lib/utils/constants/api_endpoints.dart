// File: api_endpoints.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class QApiEndpoints {
  QApiEndpoints._(); // Private constructor to prevent instantiation

  static String? baseUrl = dotenv.env['API_URL'];


  // User
  static String? doesUserExist = '$baseUrl/User/doesEmailExists';
  static String? registerUser = '$baseUrl/User/register';
  static String? loginUser = '$baseUrl/User/login';
  static String? logoutUser = '$baseUrl/User/logout';
  static String? verifyToken = '$baseUrl/User/verifyToken';
  static String? userProfile = '$baseUrl/User/profile';


  // Services
  static String? serviceCategories = '$baseUrl/Service/Categories';

  
}
