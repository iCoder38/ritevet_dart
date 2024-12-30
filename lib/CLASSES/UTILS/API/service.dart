import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';

class ApiService {
  // final String baseUrl;

  ApiService();

  /// Login Service that directly handles the request and returns parsed response
  Future<Map<String, dynamic>> loginService(
    String email,
    String password,
    String deviceToken,
    String action,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(BASE_URL),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'action': action,
          'email': email,
          'password': password,
          'device':
              platformIs().toString(), // Detects the platform (Android/iOS)
          'deviceToken': deviceToken,
        },
      );

      print("Service: HTTP response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        return json.decode(response.body); // Parse and return JSON response
      } else {
        return {
          'success': false,
          'alertMessage': 'Error: ${response.statusCode}',
        };
      }
    } catch (error) {
      print("Service: Error occurred: $error");
      return {
        'success': false,
        'alertMessage': 'Error occurred: $error',
      };
    }
  }
}
