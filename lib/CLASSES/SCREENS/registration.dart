import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/web.dart';
import 'package:ritevet_dart/CLASSES/UTILS/API/service.dart';
import 'package:ritevet_dart/CLASSES/UTILS/RESOURCES/resources.dart';
import 'package:ritevet_dart/CLASSES/UTILS/alerts.dart';
import 'package:ritevet_dart/CLASSES/UTILS/common.dart';
import 'package:ritevet_dart/CLASSES/UTILS/methods.dart';
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';

class RegsitrationScreen extends StatefulWidget {
  const RegsitrationScreen({super.key});

  @override
  State<RegsitrationScreen> createState() => _RegsitrationScreenState();
}

class _RegsitrationScreenState extends State<RegsitrationScreen> {
  // api service
  final ApiService apiService = ApiService();
  // textfields
  late final TextEditingController contFirstName;
  late final TextEditingController contLastName;
  late final TextEditingController contEmail;
  late final TextEditingController contGender;
  late final TextEditingController contPhoneNumber;
  late final TextEditingController contDOB;
  late final TextEditingController contAddress;
  late final TextEditingController contCountry;
  late final TextEditingController contState;
  late final TextEditingController contCity;
  late final TextEditingController contZipcode;
  late final TextEditingController contPassword;
  late final TextEditingController contConfirmPassword;
  // gender
  String storeGender = '';
  // country
  String storeCountryId = '';
  var arrCountryList = [];
  // state
  String storeStateId = '';
  var arrStateList = [];
  // city
  String storeCityId = '';
  var arrCityList = [];
  // dob
  String storeStartDateToParse = '';
  @override
  void initState() {
    // apiRepository = ApiRepository(apiService: ApiService());
    contFirstName = TextEditingController();
    contLastName = TextEditingController();
    contEmail = TextEditingController();
    contGender = TextEditingController();
    contPhoneNumber = TextEditingController();
    contAddress = TextEditingController();
    contCountry = TextEditingController();
    contState = TextEditingController();
    contCity = TextEditingController();
    contZipcode = TextEditingController();
    contPassword = TextEditingController();
    contConfirmPassword = TextEditingController();
    contDOB = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    contFirstName.dispose();
    contLastName.dispose();
    contEmail.dispose();
    contGender.dispose();
    contPhoneNumber.dispose();
    contPassword.dispose();
    contAddress.dispose();
    contCountry.dispose();
    contState.dispose();
    contCity.dispose();
    contZipcode.dispose();
    contPassword.dispose();
    contConfirmPassword.dispose();
    contDOB.dispose();

    super.dispose();
  }

  // country wb
  Future<void> countryListWB(context) async {
    showLoadingUI(context, AppResources.text.textPleaseWait);

    String action = AppResources.action.actionCountryList;
    try {
      final response = await apiService.countryListService(action);
      customLog('Action ==> $action');

      customLog(response['data'][0]);

      if (response['status'].toString() == AppResources.text.textSuccess) {
        if (kDebugMode) {
          print("UI: Login Successful");
        }

        arrCountryList = response['data'];
        dismissAlert(context);
        showDraggableBottomSheet();
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

  Future<void> stateListWB(context) async {
    showLoadingUI(context, AppResources.text.textPleaseWait);

    String action = AppResources.action.actionStateList;
    customLog('Action ==> $action');

    try {
      final response = await apiService.stateListService(
        action,
        storeCountryId,
      );

      customLog(response['data'][0]);

      if (response['status'].toString() == AppResources.text.textSuccess) {
        if (kDebugMode) {
          print("UI: Login Successful");
        }

        arrStateList = response['data'];
        dismissAlert(context);
        showStateBottomSheet(context);
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

  validationBeforeSubmit() {
    if (contFirstName.text == '') {
      showExceptionPopup(context, 'Please enter first name.'.toString());
      return;
    }
    if (contLastName.text == '') {
      showExceptionPopup(context, 'Please enter last name.'.toString());
      return;
    }
    if (contEmail.text == '') {
      showExceptionPopup(
          context, 'Please enter your email address.'.toString());
      return;
    }
    if (contPhoneNumber.text == '') {
      showExceptionPopup(context, 'Please enter your phone number.'.toString());
      return;
    }
    if (contAddress.text == '') {
      showExceptionPopup(context, 'Please enter address.'.toString());
      return;
    }
    if (contPassword.text == '') {
      showExceptionPopup(context, 'Please enter password.'.toString());
      return;
    }
    if (contConfirmPassword.text == '') {
      showExceptionPopup(context, 'Please enter confirm.'.toString());
      return;
    }
    if (contPassword.text != contConfirmPassword.text) {
      showExceptionPopup(context, 'Password not matched.'.toString());
      return;
    } else {
      showLoadingUI(context, AppResources.text.textPleaseWait);
      // hit api
      registraionWB(context);
    }
  }

  Future<void> registraionWB(context) async {
    String action = AppResources.action.actionRegistration;
    customLog('Action ==> $action');
    try {
      final response = await apiService.RegistrationService(
        action,
        contFirstName.text.toString(),
        contLastName.text.toString(),
        contEmail.text.toString(),
        storeGender.toString(),
        contPhoneNumber.text.toString(),
        storeStartDateToParse.toString(),
        contAddress.text.toString(),
        storeCountryId.toString(),
        storeStateId.toString(),
        storeCityId.toString(),
        contZipcode.text.toString(),
        contPassword.text.toString(),
        contConfirmPassword.text.toString(),
      );

      customLog(response);

      if (response['status'].toString() == AppResources.text.textSuccess) {
        if (kDebugMode) {
          print("UI: Login Successful");
        }

        dismissAlert(context);

        // store data securely
        final storage = FlutterSecureStorage();
        String jsonString = jsonEncode(response);
        await storage.write(
          key: AppResources.text.textSaveLoginResponseKey,
          value: jsonString,
        );

        showSuccessPopup(context, response['msg'].toString());
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

  Future<void> cityListWB(context) async {
    if (storeCountryId == '') {
      showExceptionPopup(context, 'Please select state first.'.toString());
      return;
    }
    showLoadingUI(context, AppResources.text.textPleaseWait);

    String action = AppResources.action.actionCityList;
    try {
      final response = await apiService.cityListService(
        action,
        storeStateId.toString(), // state id
      );

      customLog(response['data'][0]);

      if (response['status'].toString() == AppResources.text.textSuccess) {
        if (kDebugMode) {
          print("UI: Login Successful");
        }

        arrCityList = response['data'];
        dismissAlert(context);
        showCityBottomSheet(context);
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
      appBar: CustomAppbar(
        title: AppResources.text.textSignUp,
        leading: IconButton(
          onPressed: () {
            dismissAlert(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: hexToColor(AppResources.hexColor.whiteColor),
          ),
        ),
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
      child: _UIKit(context),
    );
  }

  Widget _UIKit(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildRegistrationCustomTextfield(
            'First name*',
            TextInputType.none,
            false, // read only
            contFirstName,
          ),
          _buildRegistrationCustomTextfield(
            'Last name*',
            TextInputType.none,
            false, // read only
            contLastName,
          ),
          _buildRegistrationCustomTextfield(
            'Email Address*',
            TextInputType.emailAddress,
            false, // read only
            contEmail,
          ),
          _buildRegistrationCustomTextfield(
            'Gender',
            TextInputType.none,
            true, // read only
            contGender,
          ),
          _buildRegistrationCustomTextfield(
            'Phone number*',
            TextInputType.number,
            false, // read only
            contPhoneNumber,
          ),
          _buildRegistrationCustomTextfield(
            'DOB (MM/DD/YYYY)',
            TextInputType.none,
            true, // read only
            contDOB,
          ),
          _buildRegistrationCustomTextfield(
            'Address*',
            TextInputType.none,
            false, // read only
            contAddress,
          ),
          _buildRegistrationCustomTextfield(
            'Country',
            TextInputType.none,
            true, // read only
            contCountry,
          ),
          _buildRegistrationCustomTextfield(
            'State',
            TextInputType.none,
            true, // read only
            contState,
          ),
          _buildRegistrationCustomTextfield(
            'City',
            TextInputType.none,
            true, // read only
            contCity,
          ),
          _buildRegistrationCustomTextfield(
            'Zipcode',
            TextInputType.number,
            false, // read only
            contZipcode,
          ),
          _buildRegistrationCustomTextfield(
            'Password*',
            TextInputType.number,
            false, // read only
            contPassword,
          ),
          _buildRegistrationCustomTextfield(
            'Confirm password*',

            TextInputType.number,
            false, // read only
            contConfirmPassword,
          ),
          CustomButton(
            text: 'Signup',
            color: AppResources.colors.appNavigationColor,
            textColor: hexToColor(AppResources.hexColor.whiteColor),
            onPressed: () {
              validationBeforeSubmit();
            },
          )
        ],
      ),
    );
  }

  _buildRegistrationCustomTextfield(
    String title,
    TextInputType keyboardType,
    bool readOnly,
    controller,
  ) {
    return CustomTextField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      labelText: title,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: svgImage(svgImageTitle, 14.0, 14.0),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter $title';
        }
        return null;
      },
      onTap: () async {
        if (title == 'Gender') {
          customLog('Gender');
          showGenderSelector(context);
        } else if (title == 'Country') {
          customLog('Country');
          countryListWB(context);
        } else if (title == 'State') {
          customLog('State');
          stateListWB(context);
        } else if (title == 'City') {
          customLog('City');
          cityListWB(context);
        } else if (title == 'DOB (MM/DD/YYYY)') {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now().subtract(Duration(days: 13 * 365)),
            firstDate: DateTime(1900), // Set a reasonable minimum date
            lastDate: DateTime.now().subtract(Duration(days: 13 * 365)),
          );
          if (pickedDate != null) {
            String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
            storeStartDateToParse = formattedDate;
            contDOB.text = storeStartDateToParse;
          }
        }
      },
    );
  }

  // gender click
  void showGenderSelector(BuildContext context) async {
    String? selectedGender = await genderPopup(context, "Select Gender");

    if (selectedGender != null) {
      // print("Selected Gender: $selectedGender");
      storeGender = selectedGender;
      contGender.text = storeGender;
    } else {
      // print("Dialog Dismissed");
      storeGender = '';
      contGender.text = 'Please select you gender.';
    }
  }

  void showDraggableBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        width: 50,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: arrCountryList.length,
                          itemBuilder: (context, index) {
                            final item = arrCountryList[index];
                            return ListTile(
                              title: Text(item['name']),
                              // subtitle: Text(item['phonecode']),
                              onTap: () {
                                Navigator.pop(context, item);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    ).then((selectedItem) {
      if (selectedItem != null) {
        // print("Selected Item: $selectedItem");
        storeCountryId = selectedItem['id'].toString();
        customLog(storeCountryId);
        contCountry.text = selectedItem['name'].toString();
        //
        contState.text = '';
        storeStateId = '';
        contCity.text = '';
        storeCityId = '';
      }
    });
  }

  // state bottom sheet
  void showStateBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        width: 50,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: arrStateList.length,
                          itemBuilder: (context, index) {
                            final item = arrStateList[index];
                            return ListTile(
                              title: Text(item['name']),
                              // subtitle: Text(item['phonecode']),
                              onTap: () {
                                Navigator.pop(context, item);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    ).then((selectedItem) {
      if (selectedItem != null) {
        // print("Selected Item: $selectedItem");
        storeStateId = selectedItem['id'].toString();
        customLog(storeStateId);
        contState.text = selectedItem['name'].toString();
      }
    });
  }

  // city
  // city bottom sheet
  void showCityBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        width: 50,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: arrCityList.length,
                          itemBuilder: (context, index) {
                            final item = arrCityList[index];
                            return ListTile(
                              title: Text(item['name']),
                              // subtitle: Text(item['phonecode']),
                              onTap: () {
                                Navigator.pop(context, item);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    ).then((selectedItem) {
      if (selectedItem != null) {
        // print("Selected Item: $selectedItem");
        storeCityId = selectedItem['id'].toString();
        customLog(storeCityId);
        contCity.text = selectedItem['name'].toString();
      }
    });
  }
}
