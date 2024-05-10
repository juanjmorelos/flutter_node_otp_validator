import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_project/helpers/helpers.dart';
import 'package:otp_project/providers/verify_provider.dart';
import 'package:otp_project/screens/components/loader.dart';




class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);
    final notifier = ref.watch(verifyProvider.notifier);
    final provider = ref.watch(verifyProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Verifica tu cuenta", style: TextStyle(color: color.primaryColor),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.email_rounded, size: 150, color: Colors.grey),
                    const SizedBox(height: 15),
                    const Text(
                      "Por favor introduce tu correo electrónico, enviaremos un código a tu correo para verificar que eres tu y seguir con el registro",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Nombre",
                        ),
                        onChanged: notifier.onNameChange,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa un nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Correo electrónico"
                        ),
                        onChanged: notifier.onEmailChange,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa un correo electrónico';
                          }
                          // Expresión regular para validar un correo electrónico
                          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Correo electrónico no es valido';
                          }
                          return null;
                        }
                      ),
                    ),
                    const SizedBox(height: 30),
                    FilledButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          notifier.sendEmailToVerify().then((value) {
                            if(value.success) {
                              context.push("/verifyEmail/${value.email}");
                            } else {
                              Helpers.showAlertDialog(value.msg, context, false);
                            }
                          });
                          
                        }
                      }, 
                      child: const Text("Continuar", style: TextStyle(fontSize: 18))
                    )
                  ],
                ),
              ),
            ),
          ),
          if(provider.isLoading)
          FadeIn(child: const Loader(message: "Enviando correo electrónico, por favor espere...")),
        ],
      )
    );
  }
}