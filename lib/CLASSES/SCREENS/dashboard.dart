import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ritevet_dart/CLASSES/UTILS/RESOURCES/resources.dart';
import 'package:ritevet_dart/CLASSES/UTILS/alerts.dart';
import 'package:ritevet_dart/CLASSES/UTILS/common.dart';
import 'package:ritevet_dart/CLASSES/UTILS/drawer.dart';
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: CustomAppbar(
        title: AppResources.text.textDashboard,
        leading: IconButton(
            onPressed: () {
              customLog('drawer');
              // open drawer
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
      ),
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
          Expanded(
            child: GestureDetector(
              onTap: () {
                showPetParentPopup(
                  context: context,
                  message:
                      'Do you want to register as a Pet Parent in the app?',
                  onOk: () {
                    // Code to execute on "Ok"
                    customLog('Ok button pressed');
                  },
                  onDismiss: () {
                    // Code to execute on "Dismiss"
                    customLog('Register button pressed');
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: SizedBox(
                          child: Image.asset(
                            'assets/images/pet_parent_unlock.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: SizedBox(
                          child: Image.asset(
                            'assets/images/veterinarian_unlock.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 200, 71, 24),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
