import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_project/helpers/helpers.dart';
import 'package:otp_project/providers/verify_provider.dart';
import 'package:otp_project/screens/components/loader.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends ConsumerWidget {
  final String email;

  const VerifyScreen({
    super.key, 
    required this.email
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(verifyProvider.notifier);
    final provider = ref.watch(verifyProvider);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.mark_email_read_rounded, size: 150, color: Colors.grey),
                const SizedBox(height: 15),
                const Text(
                  "Introduce el código que hemos enviado a tu correo electrónico, si no lo encuentras revisa tu bandeja de correos no deseados",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Pinput(
                  length: 6,
                  onCompleted: (value) async {
                    if(value.isNotEmpty) {
                      notifier.sendTokenToVerify(email, value).then((value) {
                        if(value.success) {
                          Helpers.showAlertDialog("Email verificado correctamente", context, true);
                        } else {
                          Helpers.showAlertDialog(value.msg, context, false);
                        }
                      });
                    } 
                  } ,
                )
              ],
            ),
          ),
          if(provider.isLoading)
          FadeIn(child: const Loader(message: "Verificando, por favor espere...")),
        ],
      ),
    );
  }
}