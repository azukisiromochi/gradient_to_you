import 'dart:async' show Future;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';
import 'package:progressive_image/progressive_image.dart';

import '../../app_store.dart';

class Splash extends StatelessWidget {
  const Splash({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    Future<void>.delayed(const Duration(seconds: 3)).then(
        (_) => {Navigator.of(context).pushReplacementNamed('/color_palette')});

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: ProgressiveImage(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: AppThemeUtils.thumbnailImage(store.themeNo),
              thumbnail: AppThemeUtils.thumbnailImage(store.themeNo),
              image: AppThemeUtils.splashImage(store.themeNo),
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
            child: FadeAnimatedTextKit(
              text: <String>[
                '',
                l10n.appName,
              ],
              textStyle: AppThemeUtils.logoStyle(store.themeNo),
              textAlign: TextAlign.start,
              duration: const Duration(seconds: 2),
            ),
//            child: Text(
//              l10n.appName,
//              style: AppThemeUtils.logoStyle(store.themeNo),
//            ),
          ),
        ],
      ),
    );
  }
}
