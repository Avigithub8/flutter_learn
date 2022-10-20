import 'package:flutter/material.dart';

class AppSnackBar {
  static showSnackBar({
    required BuildContext context,
    required String message,
    bool isSuccess = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    var snackBar = SnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
