import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dokan/UI/login.dart';
import 'package:flutter/material.dart';


class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Image.asset('assets/images/dokan.PNG'),
      nextScreen: LoginPage() ,
      splashTransition: SplashTransition.fadeTransition,
       backgroundColor: const Color.fromRGBO(248, 248, 248, 1)
    );
  }
}