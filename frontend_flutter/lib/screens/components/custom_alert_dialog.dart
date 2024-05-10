import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String message;
  final bool success;

  const CustomAlertDialog({super.key, required this.message, required this.success});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Column(
        children: [
          Icon(
            success ? Icons.check_circle_rounded : Icons.error_rounded, 
            color: success ? Colors.green[900] : Colors.red[900],
            size: 90,
          ),
          const SizedBox(height: 10),
          Text(
            message, 
            style: const TextStyle(fontSize: 15), 
            textAlign: TextAlign.center
          )
        ],
      ),
    );
  }
}