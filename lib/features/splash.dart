import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shamel_fibo/core/routing/router_generation.dart';
import 'package:shamel_fibo/core/widgets/CustomBackground.dart';

class SplashScreen extends StatefulWidget {
  @override
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      context.go(RouterGeneration.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return splashBackground(
      child: AnimatedSplashScreen(
        splash: Image.asset("assets/Images/logo.png"),
        nextScreen: Container(),
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 800),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
