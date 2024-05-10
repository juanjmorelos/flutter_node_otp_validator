import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_project/screens/components/custom_alert_dialog.dart';

class Helpers {
  static void showAlertDialog(String message, BuildContext context, bool success) {
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        content: CustomAlertDialog(message: message, success: success),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            }, 
            child: const Text("Aceptar"))
        ],
      ),
    );
  }
}