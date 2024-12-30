import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trust_travel/classes/structure/BLOC/screens/feeds/main_file.dart';
// import 'package:trust_travel/classes/third_party/bottom_bar/bottom_bar.dart';
// import 'package:trust_travel/classes/screens/presenting_screen/presenting.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  RemoteMessage? initialMessage;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    // FirebaseAuth.instance.signOut();
    checkNotificationPermission();
    checkUserIsLoginOrNot(context);

    //
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('A new onMessageOpenedApp event was published!');
      }
      // Handle notification message here
    });
    super.initState();
  }

  checkNotificationPermission() async {
    //
    NotificationSettings settings = await firebaseMessaging.requestPermission(
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
    // to get device token
    fetchDeviceToken();

    await onMessage();
  }

  fetchDeviceToken() async {
    FirebaseMessaging firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    firebaseMessaging.getToken().then((token) {
      customLog("token is $token");

      getAndSaveToken(token);
    });
    //

    foregorundHandler();
  }

  getAndSaveToken(token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('deviceToken', token.toString());
  }

  foregorundHandler() async {
    if (kDebugMode) {
      print('==== FOREGROUND ACCESS ====');
      print('YES');
      print('===========================');
    }
    // foreground access
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //
    bacgroundNotificationHandler();
  }

  bacgroundNotificationHandler() {
    //
    if (kDebugMode) {
      print('==== BACKGROUND ACCESS ====');
      print('YES');
      print('===========================');
    }
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    //
    // check onboarding
  }

  onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        // Show notification manually
        // print('Message Notification Title: ${message.notification!.title}');
        // print('Message Notification Body: ${message.notification!.body}');

        // Use a plugin like flutter_local_notifications to show notifications
        /*showNotification(
            message.notification!.title, message.notification!.body);*/
      }
    });
  }

  Future firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    if (kDebugMode) {
      print("Handling a background message: ${message.messageId}");
    }
  }

  updateMyToken() {}
  checkUserIsLoginOrNot(context) {
    //
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (kDebugMode) {
          print('User is currently signed out!');
        }
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const PresentingScreen(),
        //   ),
        // );
      } else {
        if (kDebugMode) {
          print('User is signed in!');
          print(FirebaseAuth.instance.currentUser!.uid);
        }
        // FirebaseAuth.instance.signOut();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const BottomBarScreen(specificBarIndex: 1),
        //   ),
        // );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}
