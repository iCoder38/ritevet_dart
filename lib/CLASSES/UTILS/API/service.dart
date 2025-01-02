import 'dart:convert';
import 'package:flutter/foundation.dart';
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

  // country list
  Future<Map<String, dynamic>> countryListService(
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
        },
      );

      if (kDebugMode) {
        print("Service: HTTP response status: ${response.statusCode}");
      }

      if (response.statusCode == 200) {
        return json.decode(response.body); // Parse and return JSON response
      } else {
        return {
          'success': false,
          'alertMessage': 'Error: ${response.statusCode}',
        };
      }
    } catch (error) {
      if (kDebugMode) {
        print("Service: Error occurred: $error");
      }
      return {
        'success': false,
        'alertMessage': 'Error occurred: $error',
      };
    }
  }

  // state list
  Future<Map<String, dynamic>> stateListService(
    String action,
    String countryId,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(BASE_URL),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'action': action,
          'counttyId': countryId.toString(),
        },
      );

      if (kDebugMode) {
        print("Service: HTTP response status: ${response.statusCode}");
      }

      if (response.statusCode == 200) {
        return json.decode(response.body); // Parse and return JSON response
      } else {
        return {
          'success': false,
          'alertMessage': 'Error: ${response.statusCode}',
        };
      }
    } catch (error) {
      if (kDebugMode) {
        print("Service: Error occurred: $error");
      }
      return {
        'success': false,
        'alertMessage': 'Error occurred: $error',
      };
    }
  }

  // state list
  Future<Map<String, dynamic>> cityListService(
    String action,
    String stateId,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(BASE_URL),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'action': action,
          'state_id': stateId.toString(),
        },
      );

      if (kDebugMode) {
        print("Service: HTTP response status: ${response.statusCode}");
      }

      if (response.statusCode == 200) {
        return json.decode(response.body); // Parse and return JSON response
      } else {
        return {
          'success': false,
          'alertMessage': 'Error: ${response.statusCode}',
        };
      }
    } catch (error) {
      if (kDebugMode) {
        print("Service: Error occurred: $error");
      }
      return {
        'success': false,
        'alertMessage': 'Error occurred: $error',
      };
    }
  }

  // registration
  // state list
  Future<Map<String, dynamic>> RegistrationService(
    String action,
    String firstName,
    String lastName,
    String email,
    String gender,
    String phoneNumber,
    String dob,
    String address,
    String country,
    String state,
    String city,
    String zipcode,
    String password,
    String confirmPassword,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(BASE_URL),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'action': action,
          'email': email.toString(),
          'firstName': firstName.toString(),
          'lastName': lastName.toString(),
          'contactNumber': phoneNumber.toString(),
          'password': password.toString(),
          'address': address.toString(),
          'cityId': city.toString(),
          'stateId': state.toString(),
          'countryId': country.toString(),
          'gender': gender.toString(),
          'dob': dob.toString(),
          'zipCode': zipcode.toString(),
          'role': 'Member'.toString(),
          'device': platformIs().toString(),
          'deviceToken': ''.toString(),
        },
      );

      if (kDebugMode) {
        print("Service: HTTP response status: ${response.statusCode}");
      }

      if (response.statusCode == 200) {
        return json.decode(response.body); // Parse and return JSON response
      } else {
        return {
          'success': false,
          'alertMessage': 'Error: ${response.statusCode}',
        };
      }
    } catch (error) {
      if (kDebugMode) {
        print("Service: Error occurred: $error");
      }
      return {
        'success': false,
        'alertMessage': 'Error occurred: $error',
      };
    }
  }

// action:petparentregistration
// userId:1
// UTYPE:1
// VFirstName:
// VLastName:
  Future<Map<String, dynamic>> RegisterAsPetParentService(
    String action,
    String userId,
    String UTYPE,
    String VFirstName,
    String VLastName,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(BASE_URL),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'action': action,
          'userId': userId.toString(),
          'UTYPE': UTYPE.toString(),
          'VFirstName': VFirstName.toString(),
          'VLastName': VLastName.toString(),
        },
      );

      if (kDebugMode) {
        print("Service: HTTP response status: ${response.statusCode}");
      }

      if (response.statusCode == 200) {
        return json.decode(response.body); // Parse and return JSON response
      } else {
        return {
          'success': false,
          'alertMessage': 'Error: ${response.statusCode}',
        };
      }
    } catch (error) {
      if (kDebugMode) {
        print("Service: Error occurred: $error");
      }
      return {
        'success': false,
        'alertMessage': 'Error occurred: $error',
      };
    }
  }
}
