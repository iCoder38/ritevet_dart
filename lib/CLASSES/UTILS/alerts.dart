import 'package:flutter/material.dart';
import 'package:ritevet_dart/CLASSES/UTILS/RESOURCES/resources.dart';
import 'package:ritevet_dart/CLASSES/UTILS/common.dart';
import 'package:ritevet_dart/CLASSES/UTILS/methods.dart';
// import 'package:trust_travel/classes/structure/BLOC/utilities/widgets/common/common_widgets.dart';
// import 'package:trust_travel/classes/structure/common/methods.dart';

void showLoadingUI(BuildContext context, String message) async {
  await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: getAppThemeColor(context),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: getSpinKitWidget(
                      SpinKitIndicatorType.fadingCube,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  /*textFont(
                    message,
                    hexToColor(AppResources.hexColor.whiteColor),
                    14.0,
                    FontFamiltyNameUtils().fontPoppins,
                  ),*/
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

// SUCCESS POPUP
void showSuccessPopup(BuildContext context, String message) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // getAppThemeColor(context),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    SizedBox(
                      width: 80,
                      child: Image.asset(
                        'assets/images/success.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: customText(
                          message,
                          18.0,
                          context,
                          darkModeColor:
                              hexToColor(AppResources.hexColor.blackColor),
                          lightModeColor:
                              hexToColor(AppResources.hexColor.blackColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.0),
              GestureDetector(
                onTap: () {
                  dismissAlert(context);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    // getAppThemeColor(context),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: customText(
                          'Ok',
                          18.0,
                          context,
                          fontWeight: FontWeight.w800,
                          darkModeColor:
                              hexToColor(AppResources.hexColor.whiteColor),
                          lightModeColor:
                              hexToColor(AppResources.hexColor.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showExceptionPopup(BuildContext context, String message) async {
  await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  // getAppThemeColor(context),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: customText(
                          message,
                          18.0,
                          context,
                          darkModeColor:
                              hexToColor(AppResources.hexColor.whiteColor),
                          lightModeColor:
                              hexToColor(AppResources.hexColor.whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.0),
              GestureDetector(
                onTap: () {
                  dismissAlert(context);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    // getAppThemeColor(context),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: customText(
                          'Dismiss',
                          18.0,
                          context,
                          fontWeight: FontWeight.w800,
                          darkModeColor:
                              hexToColor(AppResources.hexColor.whiteColor),
                          lightModeColor:
                              hexToColor(AppResources.hexColor.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<String?> genderPopup(BuildContext context, String message) async {
  return await showDialog<String>(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, "Male"); // Return "Male"
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            child: Image.asset(
                              'assets/images/male.png',
                            ),
                          ),
                          customText('Male', 16.0, context),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, "Female"); // Return "Female"
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            child: Image.asset(
                              'assets/images/female.png',
                            ),
                          ),
                          customText('Female', 16.0, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.0),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, null); // Return null on dismiss
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: customText(
                          'Dismiss',
                          18.0,
                          context,
                          fontWeight: FontWeight.w800,
                          darkModeColor:
                              hexToColor(AppResources.hexColor.whiteColor),
                          lightModeColor:
                              hexToColor(AppResources.hexColor.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// PET PARENT ALERT
Future<void> showPetParentPopup({
  required BuildContext context,
  required String message,
  VoidCallback? onOk,
  VoidCallback? onDismiss,
}) async {
  await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 140,
                      child: Image.asset(
                        'assets/images/pet_parent_unlock.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: customText(
                          message,
                          18.0,
                          context,
                          darkModeColor:
                              hexToColor(AppResources.hexColor.blackColor),
                          lightModeColor:
                              hexToColor(AppResources.hexColor.blackColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6.0),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        if (onOk != null) {
                          onOk();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: customText(
                            'Dismiss',
                            18.0,
                            context,
                            fontWeight: FontWeight.w800,
                            darkModeColor:
                                hexToColor(AppResources.hexColor.whiteColor),
                            lightModeColor:
                                hexToColor(AppResources.hexColor.whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        if (onDismiss != null) {
                          onDismiss();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppResources.colors.appNavigationColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: customText(
                            AppResources.text.textRegister,
                            18.0,
                            context,
                            fontWeight: FontWeight.w800,
                            darkModeColor:
                                hexToColor(AppResources.hexColor.whiteColor),
                            lightModeColor:
                                hexToColor(AppResources.hexColor.whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
