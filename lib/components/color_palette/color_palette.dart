import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_to_you/components/gradient_builder/gradient_builder.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({Key key}) : super(key: key);

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  static const double _lightness = 0.7;
  static const double _saturation = 0.9;

  static final Color _color0 =
      const HSLColor.fromAHSL(1, 0, _saturation, _lightness).toColor();
  static final Color _color30 =
      const HSLColor.fromAHSL(1, 30, _saturation, _lightness).toColor();
  static final Color _color60 =
      const HSLColor.fromAHSL(1, 60, _saturation, _lightness).toColor();
  static final Color _color90 =
      const HSLColor.fromAHSL(1, 90, _saturation, _lightness).toColor();
  static final Color _color120 =
      const HSLColor.fromAHSL(1, 120, _saturation, _lightness).toColor();
  static final Color _color150 =
      const HSLColor.fromAHSL(1, 150, _saturation, _lightness).toColor();
  static final Color _color180 =
      const HSLColor.fromAHSL(1, 180, _saturation, _lightness).toColor();
  static final Color _color210 =
      const HSLColor.fromAHSL(1, 210, _saturation, _lightness).toColor();
  static final Color _color240 =
      const HSLColor.fromAHSL(1, 240, _saturation, _lightness).toColor();
  static final Color _color270 =
      const HSLColor.fromAHSL(1, 270, _saturation, _lightness).toColor();
  static final Color _color300 =
      const HSLColor.fromAHSL(1, 300, _saturation, _lightness).toColor();
  static final Color _color330 =
      const HSLColor.fromAHSL(1, 330, _saturation, _lightness).toColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
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
        backgroundColorStart: const Color(0xffe4a972).withOpacity(0.6),
        backgroundColorEnd: const Color(0xff9941d8).withOpacity(0.6),
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
              color: _color0,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color0);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color30,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color30);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color60,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color60);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color90,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color90);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color120,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color120);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color150,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color150);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color180,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color180);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color210,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color210);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color240,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color240);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color270,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color270);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color300,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color300);
                },
              ),
            ),
          ),
          Container(
            child: Card(
              color: _color330,
              child: InkWell(
                splashColor: Colors.white.withAlpha(30),
                onTap: () {
                  nextPage(_color330);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void nextPage(Color backgroundColor) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        settings: const RouteSettings(name: '/gradient'),
        builder: (context) => GradientBuilder(backgroundColor: backgroundColor),
      ),
    );
  }
}
