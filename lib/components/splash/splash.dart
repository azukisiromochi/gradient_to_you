import 'dart:async' show Future;
import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 3)).then(
        (_) => {Navigator.of(context).pushReplacementNamed('/color_palette')});

    final _themeNo = Random().nextInt(2) + 1;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AppThemeUtils.splashImage(_themeNo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: AppThemeUtils.gradientColors(_themeNo),
                stops: const [
                  0.0,
                  1.0,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Gradient to you',
              style: AppThemeUtils.logoStyle(_themeNo),
            ),
          ),
        ],
      ),
    );
  }
}
