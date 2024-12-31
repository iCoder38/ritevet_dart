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
                height: 60,
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
