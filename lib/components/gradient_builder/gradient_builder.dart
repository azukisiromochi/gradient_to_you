import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientBuilder extends StatefulWidget {
  const GradientBuilder({Key key, this.backgroundColor}) : super(key: key);

  final Color backgroundColor;

  @override
  _GradientBuilderState createState() => _GradientBuilderState();
}

class _GradientBuilderState extends State<GradientBuilder> {
  @override
  Widget build(BuildContext context) {
    final _themeColor =
        HSLColor.fromColor(widget.backgroundColor).withLightness(0.2).toColor();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: _themeColor),
        title: Text(
          'Gradient to you',
          style: GoogleFonts.charmonman(
            textStyle: TextStyle(
              color: _themeColor,
              decoration: TextDecoration.none,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: widget.backgroundColor,
      ),
      body: Placeholder(),
    );
  }
}
