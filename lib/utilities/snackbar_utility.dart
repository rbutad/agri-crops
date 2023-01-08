import 'package:agricrops/constants/color_constant.dart';
import 'package:flutter/material.dart';

class SnackbarUtility {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSuccessSnackBar(String? message) {
    if (message == null || message.isEmpty) return;

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: kGreen,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static showDangerSnackBar(String? message) {
    if (message == null || message.isEmpty) return;

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: kRed,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
