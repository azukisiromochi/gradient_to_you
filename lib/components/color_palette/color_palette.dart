import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({Key key}) : super(key: key);

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
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
      body: const Center(
        child: RaisedButton(
          child: Text('Launch Next Screen'),
        ),
      ),
    );
  }
}
