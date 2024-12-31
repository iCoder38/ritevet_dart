import 'package:flutter/material.dart';

void dismissAlert(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
  Navigator.pop(context);
}
