import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_to_you/components/gradient_builder/gradient_builder.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({Key key}) : super(key: key);

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  static const double _lightness = 0.7;
  static const double _saturation = 0.9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gradient to you',
          style: GoogleFonts.charmonman(
            textStyle: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black.withOpacity(0.3),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 3 / 4,
        children: <Widget>[
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 0, _saturation, _lightness)
                  .toColor(),
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      settings: const RouteSettings(name: '/gradient'),
                      builder: (context) => GradientBuilder(
                          backgroundColor: const HSLColor.fromAHSL(
                                  1, 0, _saturation, _lightness)
                              .toColor()),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 30, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 60, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 90, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 120, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 150, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 180, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 210, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 240, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 270, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 300, _saturation, _lightness)
                  .toColor(),
            ),
          ),
          Container(
            child: Card(
              color: const HSLColor.fromAHSL(1, 330, _saturation, _lightness)
                  .toColor(),
            ),
          ),
        ],
      ),
    );
  }
}
