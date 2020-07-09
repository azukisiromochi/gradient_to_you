import 'dart:math' show Random;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gradient_to_you/components/bg_image_picker/bg_image_picker.dart';
import 'package:gradient_to_you/components/color_palette/color_palette.dart';
import 'package:gradient_to_you/components/gradient_builder/gradient_builder.dart';
import 'package:gradient_to_you/components/gradient_filter/gradient_filter.dart';
import 'package:gradient_to_you/components/importer.dart';
import 'package:gradient_to_you/components/save_or_share/save_or_share.dart';
import 'package:gradient_to_you/components/splash/splash.dart';
import 'package:gradient_to_you/components/write_message/write_message.dart';

import '../app_store.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = AppStore(Random().nextInt(3) + 1);
    Preferences();

    return MaterialApp(
      title: 'Gradient to you',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Splash(store: store),
      routes: <String, WidgetBuilder>{
        Screen.colorPalette.url: (_) => ColorPalette(store: store),
        Screen.gradientBuilder.url: (_) => GradientBuilder(store: store),
        Screen.imagePicker.url: (_) => BgImagePicker(store: store),
        Screen.gradientFilter.url: (_) => GradientFilter(store: store),
        Screen.writeMessage.url: (_) => WriteMessage(store: store),
        Screen.saveOrShare.url: (_) => SaveOrShare(store: store),
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
