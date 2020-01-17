import 'dart:math';
import '../importer.dart';

class GradientBuilder extends StatefulWidget {
  const GradientBuilder({Key key, this.backgroundColor}) : super(key: key);

  final Color backgroundColor;

  @override
  _GradientBuilderState createState() => _GradientBuilderState();
}

class _GradientBuilderState extends State<GradientBuilder> {
  final _random = Random();
  Color primary;
  Color secondary;

  @override
  Widget build(BuildContext context) {
    final _themeColor =
        HSLColor.fromColor(widget.backgroundColor).withLightness(0.2).toColor();

    primary =
        _randomHsl(HSLColor.fromColor(widget.backgroundColor).hue).toColor();
    secondary = _randomHsl().toColor();

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
        backgroundColor: widget.backgroundColor,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
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
        child: InkWell(
          splashColor: Colors.white.withAlpha(30),
          onTap: () {
            setState(() {});
          },
        ),
      ),
    );
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
