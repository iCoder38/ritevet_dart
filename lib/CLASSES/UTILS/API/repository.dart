import 'package:ritevet_dart/CLASSES/UTILS/API/service.dart';
import 'package:ritevet_dart/CLASSES/UTILS/RESOURCES/resources.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository({required this.apiService});

  //////////////////////////////////////////////////////////////////////////////
  ////////////////////// check user existance //////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  Future<Map<String, dynamic>> loginRepoWB(
    String userId,
    String email,
    String password,
    String device,
    String deviceToken,
  ) {
    return apiService.loginService(
      userId,
      email,
      password,
      device,
      deviceToken,
      AppResources.action.actionLogin,
    );
  }
}
