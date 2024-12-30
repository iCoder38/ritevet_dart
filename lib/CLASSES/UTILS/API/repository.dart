// import 'dart:convert';
// import 'package:ritevet_dart/CLASSES/UTILS/API/service.dart';
// import 'package:ritevet_dart/CLASSES/UTILS/RESOURCES/resources.dart';

// class ApiRepository {
//   final ApiService apiService;

//   ApiRepository({required this.apiService});

//   /// Login repository method that parses the response
//   Future<Map<String, dynamic>> loginRepoWB(
//     String email,
//     String password,
//     String deviceToken,
//   ) async {
//     final response = await apiService.loginService(
//       email,
//       password,
//       deviceToken,
//       AppResources.action.actionLogin,
//     );

//     // Parse the response here
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       return {
//         'success': false,
//         'alertMessage': 'Error: ${response.statusCode}',
//       };
//     }
//   }
// }
