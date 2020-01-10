import 'package:flutter/material.dart';
import 'package:gradient_to_you/components/splash/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient to you',
      home: SplashPage(),
    );
  }
}