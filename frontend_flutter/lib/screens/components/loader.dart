import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String message;
  const Loader({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(189, 255, 255, 255),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 18),
          Text(message, style: const TextStyle( fontSize: 18), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}