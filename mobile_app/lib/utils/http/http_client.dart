import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quick_help/utils/constants/api_endpoints.dart';

class QHttpHelper {
  static String? baseUrl = QApiEndpoints.baseUrl;

  //Helper method to make GET requests
  static Future<Map<String, dynamic>?> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  //Helper method to make POST requests
  static Future<Map<String, dynamic>?> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  //Helper method to make PUT requests
  static Future<Map<String, dynamic>?> put(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  //Helper method to make DELETE requests
  static Future<Map<String, dynamic>?> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  //Helper method to make PATCH requests
  static Future<Map<String, dynamic>?> patch(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }


  static Map<String, dynamic>? _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
