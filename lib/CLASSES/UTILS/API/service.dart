import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';

class ApiService {
  Future<Map<String, dynamic>> loginService(
    String userId,
    String email,
    String password,
    String device,
    String deviceToken,
    String action,
  ) async {
    final getBaseUrlWithEndPoint = BASE_URL;
    try {
      final response = await http.post(
        Uri.parse(getBaseUrlWithEndPoint),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          "action": action,
          'email': email,
          'password': password,
          'device': platformIs().toString(),
          'deviceToken': deviceToken,
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          'success': false,
          'alertMessage': 'Error: ${response.statusCode}'
        };
      }
    } catch (error) {
      return {
        'success': false,
        'alertMessage': 'Error occurred: $error',
      };
    }
  }
}
