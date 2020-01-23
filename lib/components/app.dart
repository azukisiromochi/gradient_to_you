import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:gradient_to_you/components/color_palette/color_palette.dart';
import 'package:gradient_to_you/components/splash/splash.dart';

import '../app_store.dart';
import 'bg_image_picker/bg_image_picker.dart';
import 'gradient_builder/gradient_builder.dart';

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
      },
    );
  }
}
