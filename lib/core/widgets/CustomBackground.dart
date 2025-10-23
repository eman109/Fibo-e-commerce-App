import 'package:flutter/material.dart';

class splashBackground extends StatelessWidget {
  final Widget child;
  const splashBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("assets/Images/WomanSplash.png", fit: BoxFit.cover),
        child,
      ],
    );
  }
}
