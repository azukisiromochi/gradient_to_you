import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_to_you/components/gradient_builder/gradient_builder.dart';
import 'package:gradient_to_you/configs/g_2_u_colors.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({Key key, this.themeNo}) : super(key: key);

  final int themeNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text(
          'Gradient to you',
          style: GoogleFonts.charmonman(
            textStyle: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColorStart: const Color(0xffe4a972).withOpacity(0.6),
        backgroundColorEnd: const Color(0xff9941d8).withOpacity(0.6),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
//        childAspectRatio: 3 / 4,
        children: const <Widget>[
          Palette(paletteColor: G2UColors.hslFromHue000),
          Palette(paletteColor: G2UColors.hslFromHue030),
          Palette(paletteColor: G2UColors.hslFromHue060),
          Palette(paletteColor: G2UColors.hslFromHue090),
          Palette(paletteColor: G2UColors.hslFromHue120),
          Palette(paletteColor: G2UColors.hslFromHue150),
          Palette(paletteColor: G2UColors.hslFromHue180),
          Palette(paletteColor: G2UColors.hslFromHue210),
          Palette(paletteColor: G2UColors.hslFromHue240),
          Palette(paletteColor: G2UColors.hslFromHue270),
          Palette(paletteColor: G2UColors.hslFromHue300),
          Palette(paletteColor: G2UColors.hslFromHue330),
        ],
      ),
    );
  }
}

class Palette extends StatefulWidget {
  const Palette({Key key, this.paletteColor}) : super(key: key);

  @override
  _PaletteState createState() => _PaletteState();

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
            _nextPage(context, _paletteColor);
          },
        ),
      ),
    );
  }

  void _nextPage(BuildContext context, Color paletteColor) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        settings: const RouteSettings(name: '/gradient'),
        builder: (context) => GradientBuilder(baseColor: paletteColor),
      ),
    );
  }
}
