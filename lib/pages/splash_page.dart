import 'package:duck_gun/pages/splash_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/user_controller.dart';
import 'login_cliente.dart';
import 'navegacao/nav.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(
      builder: (context, userController, child) {
        switch (userController.authState) {
          case AuthState.signed:
            return Nav();
          case AuthState.unsigned:
            return LoginCliente();
          case AuthState.loading:
            return SplashPage();
        }
      },
    );
  }
}