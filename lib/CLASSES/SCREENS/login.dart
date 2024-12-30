import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:ritevet_dart/CLASSES/UTILS/RESOURCES/resources.dart';
import 'package:ritevet_dart/CLASSES/UTILS/common.dart';
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController contEmail;
  late final TextEditingController contPassword;

  @override
  void initState() {
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
          customText('Sign into your account', 16.0, context),
          CustomTextField(
            controller: contEmail,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16.0),
              child: svgImage('email', 14.0, 14.0),
            ),
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
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16.0),
              child: svgImage('email', 14.0, 14.0),
            ),
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
            borderRadius: 20.0,
            textStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            onPressed: () {
              customLog('Button Pressed!');
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
              customLog('Button Pressed!');
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
              customLog('Button Pressed!');
            },
          ),
        ],
      ),
    );
  }
}
