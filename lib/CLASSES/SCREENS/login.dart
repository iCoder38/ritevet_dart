import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ritevet_dart/CLASSES/SCREENS/dashboard.dart';
import 'package:ritevet_dart/CLASSES/SCREENS/registration.dart';
import 'package:ritevet_dart/CLASSES/UTILS/API/repository.dart';
import 'package:ritevet_dart/CLASSES/UTILS/API/service.dart';
// import 'package:flutter/services.dart';
import 'package:ritevet_dart/CLASSES/UTILS/RESOURCES/resources.dart';
import 'package:ritevet_dart/CLASSES/UTILS/alerts.dart';
import 'package:ritevet_dart/CLASSES/UTILS/common.dart';
import 'package:ritevet_dart/CLASSES/UTILS/methods.dart';
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController contEmail;
  late final TextEditingController contPassword;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    // apiRepository = ApiRepository(apiService: ApiService());
    contEmail = TextEditingController();
    contPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    contEmail.dispose();
    contPassword.dispose();

    super.dispose();
  }

  Future<void> loginWB(context) async {
    showLoadingUI(context, AppResources.text.textPleaseWait);

    String email = contEmail.text;
    String password = contPassword.text;
    String deviceToken = '111111111111111111111';
    String action = AppResources.action.actionLogin;

    try {
      final response = await apiService.loginService(
        email,
        password,
        deviceToken,
        action,
      );
      // if (kDebugMode) {
      //   print("UI: Response received: $response");
      // }
      customLog(response);

      if (response['status'].toString() == AppResources.text.textSuccess) {
        if (kDebugMode) {
          print("UI: Login Successful");
        }
        // store data securely
        final storage = FlutterSecureStorage();
        String jsonString = jsonEncode(response);
        await storage.write(
          key: AppResources.text.textSaveLoginResponseKey,
          value: jsonString,
        );

        dismissAlert(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
      } else {
        customLog(response['status'].toString());
        dismissAlert(context);
        showExceptionPopup(context, response['msg'].toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print("UI: Error occurred: $e");
      }
      dismissAlert(context);
      showExceptionPopup(context, e.toString());
    } finally {
      customLog('Finally');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: AppResources.text.textLogin),
      body: _UIBGImage(),
    );
  }

  Container _UIBGImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(BG_IMAGE),
          fit: BoxFit.cover,
        ),
      ),
      child: _UIKit(),
    );
  }

  SingleChildScrollView _UIKit() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(LOGO_1000),
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Expanded(child: SizedBox()),
          // Spacer(),
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 200),
              customText('Sign into your account', 16.0, context),
              CustomTextField(
                controller: contEmail,
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email',
                // suffixIcon: Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: svgImage('email', 14.0, 14.0),
                // ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter email';
                  }
                  return null;
                },
              ),
              CustomTextField(
                secureText: true,
                controller: contPassword,
                labelText: 'Password',
                // suffixIcon: Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: svgImage('email', 14.0, 14.0),
                // ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password';
                  }
                  return null;
                },
              ),
              CustomButton(
                text: AppResources.text.textLogin,
                height: 60,
                width: double.infinity,
                color: AppResources.colors.appBackgroundColor,
                textColor: hexToColor(AppResources.hexColor.whiteColor),
                borderRadius: 20.0,
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                onPressed: () {
                  customLog('Button Pressed 2');
                  loginWB(context);
                },
              ),
              CustomButton(
                text: AppResources.text.forgotPassword,
                height: 40,
                width: double.infinity,
                // color: AppResources.colors.appBackgroundColor,
                borderRadius: 20.0,
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: hexToColor(AppResources.hexColor.blackColor),
                ),
                onPressed: () {
                  customLog("Clicked: Forgot password");
                },
              ),
              CustomButton(
                text: AppResources.text.dontHaveAnAccount,
                height: 30,
                width: double.infinity,
                // color: AppResources.colors.darkButtonColor,
                borderRadius: 20.0,
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppResources.colors.darkButtonColor,
                ),
                onPressed: () {
                  customLog("Clicked: Don't have an account? Sign up");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegsitrationScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20.0)
        ],
      ),
    );
  }
}
