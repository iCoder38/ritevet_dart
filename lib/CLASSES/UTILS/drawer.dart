// custom_drawer.dart
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ritevet_dart/CLASSES/SCREENS/dashboard.dart';
import 'package:ritevet_dart/CLASSES/UTILS/RESOURCES/resources.dart';
import 'package:ritevet_dart/CLASSES/UTILS/common.dart';
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  //
  String loginUserName = '';
  String loginUserAddress = '';
  var displayProfilePicture = '';

  @override
  void initState() {
    //
    localData();
    super.initState();
  }

  Future<Map<String, dynamic>?> getLoginResponse() async {
    final storage = FlutterSecureStorage();
    String? jsonString =
        await storage.read(key: AppResources.text.textSaveLoginResponseKey);
    if (jsonString != null) {
      // Decode the JSON string into a Map
      return jsonDecode(jsonString);
    }
    return null; // Return null if no data is found
  }

  localData() async {
    debugPrint('== LOCAL DATA ==');
    Map<String, dynamic>? loginData = await getLoginResponse();
    if (loginData != null) {
      // print("Login Data Retrieved: $loginData");
      customLog(loginData);
      loginUserName = loginData['data']['firstName'].toString();
      loginUserAddress = loginData['data']['address'].toString();
      setState(() {});
    } else {
      if (kDebugMode) {
        print("No login data found.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: _UIBGImage()
        // _UIKit(context),
        );
  }

  Container _UIBGImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppResources.colors.appNavigationColor,
      child: _UIKit(context),
    );
  }

  Widget _UIKit(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 80),
          Container(
            // height: 120,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            child: Column(
              children: [
                SizedBox(height: 20),
                customText(
                  loginUserName,
                  18.0,
                  context,
                  fontWeight: FontWeight.w800,
                ),
                customText(
                  loginUserAddress,
                  14.0,
                  context,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          buildListTile(
            title: "Dashboard",
            icon: Icons.home,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
            },
          ),
          Divider(),
          buildListTile(
            title: "Edit profile",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "My Posts",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Post Free Stuff",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Request Services",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Pet Store",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Sold Items",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Missed Call",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Chat",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Item Purchased",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Order received",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "My Cart",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Manage Appointments",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "My Bookings",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          Divider(),
          buildListTile(
            title: "Reviews Received",
            icon: Icons.edit,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SettingsScreen()),
              // );
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: customText(
        title,
        16.0,
        context,
        fontWeight: FontWeight.w500,
        darkModeColor: hexToColor(
          AppResources.hexColor.whiteColor,
        ),
        lightModeColor: hexToColor(
          AppResources.hexColor.whiteColor,
        ),
      ),
      onTap: onTap, // Pass the onTap function
    );
  }

  void showLogout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Delete account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child:
                    Text('Your account will be deleted account permanently.'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
