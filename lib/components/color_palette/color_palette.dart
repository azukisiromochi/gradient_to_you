import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_to_you/configs/g_2_u_colors.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

import '../../app_store.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text(
          'Gradient to you',
          style: AppThemeUtils.appBarStyle(store.themeNo),
        ),
        backgroundColorStart: store.gradientColors.first.withOpacity(0.6),
        backgroundColorEnd: store.gradientColors.last.withOpacity(0.6),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
//        childAspectRatio: 3 / 4,
        children: <Widget>[
          Palette(store: store, paletteColor: G2UColors.hslFromHue000),
          Palette(store: store, paletteColor: G2UColors.hslFromHue030),
          Palette(store: store, paletteColor: G2UColors.hslFromHue060),
          Palette(store: store, paletteColor: G2UColors.hslFromHue090),
          Palette(store: store, paletteColor: G2UColors.hslFromHue120),
          Palette(store: store, paletteColor: G2UColors.hslFromHue150),
          Palette(store: store, paletteColor: G2UColors.hslFromHue180),
          Palette(store: store, paletteColor: G2UColors.hslFromHue210),
          Palette(store: store, paletteColor: G2UColors.hslFromHue240),
          Palette(store: store, paletteColor: G2UColors.hslFromHue270),
          Palette(store: store, paletteColor: G2UColors.hslFromHue300),
          Palette(store: store, paletteColor: G2UColors.hslFromHue330),
        ],
      ),
    );
  }
}

class Palette extends StatefulWidget {
  const Palette({Key key, @required this.store, @required this.paletteColor})
      : super(key: key);

  @override
  _PaletteState createState() => _PaletteState();

  final AppStore store;
  final HSLColor paletteColor;
}

class _PaletteState extends State<Palette> {
  @override
  Widget build(BuildContext context) {
    final _paletteColor = widget.paletteColor.toColor();

    return Container(
      child: Card(
        color: _paletteColor,
        child: InkWell(
          onTap: () {
            widget.store.setBaseColor(_paletteColor);
            Navigator.of(context).pushNamed('/gradient');
          },
        ),
      ),
    );
  }
}
