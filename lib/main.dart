import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:ritevet_dart/CLASSES/SCREENS/splash.dart';
import 'package:ritevet_dart/CLASSES/UTILS/theme.dart';
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';

RemoteMessage? initialMessage;
FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint = (String? message, {int? wrapWidth}) {};

  try {
    await dotenv.load(fileName: ".env");
    customLog('.env loaded successfully');
  } catch (e) {
    customLog('Failed to load .env: $e');
  }

  await Firebase.initializeApp();

  // enable
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  // show notification alert ( banner )
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('User granted permission =====> ${settings.authorizationStatus}');
  }

  // background access
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // foreground access
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            theme:
                themeNotifier.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    ),
  );
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}
