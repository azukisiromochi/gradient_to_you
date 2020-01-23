import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

import '../../app_store.dart';

class Splash extends StatelessWidget {
  const Splash({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 3)).then(
        (_) => {Navigator.of(context).pushReplacementNamed('/color_palette')});

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AppThemeUtils.splashImage(store.themeNo),
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
                colors: store.gradientColors,
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
              style: AppThemeUtils.logoStyle(store.themeNo),
            ),
          ),
        ],
      ),
    );
  }
}
