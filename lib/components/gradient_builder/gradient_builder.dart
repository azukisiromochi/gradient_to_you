import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientBuilder extends StatelessWidget {
  const GradientBuilder({Key key, this.baseColor}) : super(key: key);

  final Color baseColor;

  @override
  Widget build(BuildContext context) {
    final _themeColor =
        HSLColor.fromColor(baseColor).withLightness(0.2).toColor();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        backgroundColor: baseColor,
      ),
      body: GradientBody(backgroundColor: baseColor),
    );
  }
}

class GradientBody extends StatefulWidget {
  const GradientBody({Key key, this.backgroundColor}) : super(key: key);

  final Color backgroundColor;

  @override
  _GradientBodyState createState() => _GradientBodyState();
}

class _GradientBodyState extends State<GradientBody> {
  final _random = Random();
  Color primary;
  Color secondary;
  List<FractionalOffset> gradientBeginEnd;

  @override
  Widget build(BuildContext context) {
    primary =
        _randomHsl(HSLColor.fromColor(widget.backgroundColor).hue).toColor();
    secondary = _randomHsl().toColor();
    gradientBeginEnd = _randomGradientBeginEnd();

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: gradientBeginEnd.first,
          end: gradientBeginEnd.last,
          colors: [
            primary,
            secondary,
          ],
          stops: const [
            0.0,
            1.0,
          ],
        ),
      ),
      child: InkWell(onTap: () => setState(() {})),
    );
  }

  List<FractionalOffset> _randomGradientBeginEnd() {
    switch (_random.nextInt(6)) {
      case 0:
        {
          return const [
            FractionalOffset.topLeft,
            FractionalOffset.bottomRight,
          ];
        }
        break;

      case 1:
        {
          return const [
            FractionalOffset.topCenter,
            FractionalOffset.bottomCenter,
          ];
        }
        break;

      case 2:
        {
          return const [
            FractionalOffset.topRight,
            FractionalOffset.bottomLeft,
          ];
        }
        break;

      case 3:
        {
          return const [
            FractionalOffset.bottomLeft,
            FractionalOffset.topRight,
          ];
        }
        break;

      case 4:
        {
          return const [
            FractionalOffset.bottomCenter,
            FractionalOffset.topCenter,
          ];
        }
        break;

      case 5:
        {
          return const [
            FractionalOffset.bottomRight,
            FractionalOffset.topLeft,
          ];
        }
        break;

      default:
        {
          return const [
            FractionalOffset.topLeft,
            FractionalOffset.bottomRight,
          ];
        }
        break;
    }
  }

  HSLColor _randomHsl([double hue]) {
    return HSLColor.fromAHSL(
        1, _randomHue(hue), _randomSaturation(), _randomLightness());
  }

  double _randomHue([double hue]) {
    if (hue == null) {
      return _random.nextInt(360).toDouble();
    }

    final i = _random.nextInt(30);
    if (hue == 0 && i < 15) {
      return (360.0 - 1.0) - i;
    } else {
      return hue + (i - 15);
    }
  }

  double _randomSaturation() {
    var d = _random.nextDouble();
    while (d < 0.2) {
      d = _random.nextDouble();
    }
    return d;
  }

  double _randomLightness() {
    var d = _random.nextDouble();
    while (d < 0.1 || 0.9 < d) {
      d = _random.nextDouble();
    }
    return d;
  }
}
