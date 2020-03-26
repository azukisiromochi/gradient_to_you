import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gradient_to_you/components/color_palette/color_palette.dart';
import 'package:gradient_to_you/components/save_or_share/save_or_share.dart';
import 'package:gradient_to_you/components/splash/splash.dart';
import 'package:gradient_to_you/components/write_message/write_message.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

import '../app_store.dart';
import 'bg_image_picker/bg_image_picker.dart';
import 'gradient_builder/gradient_builder.dart';
import 'gradient_filter/gradient_filter.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = AppStore(Random().nextInt(2) + 1);

    return MaterialApp(
      title: 'Gradient to you',
      home: Splash(store: store),
      routes: <String, WidgetBuilder>{
        '/color_palette': (_) => ColorPalette(store: store),
        '/gradient': (_) => GradientBuilder(store: store),
        '/image_picker': (_) => BgImagePicker(store: store),
        '/gradient_filter': (_) => GradientFilter(store: store),
        '/write_message': (_) => WriteMessage(store: store),
        '/save_or_share': (_) => SaveOrShare(store: store),
      },
      localizationsDelegates: [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
    );
  }
}
