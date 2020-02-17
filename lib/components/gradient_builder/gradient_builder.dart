import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

import '../../app_store.dart';

class GradientBuilder extends StatelessWidget {
  const GradientBuilder({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    final _themeColor = store.baseTextColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: _themeColor),
        title: Text(l10n.appName,
            style: AppThemeUtils.appBarStyle(store.themeNo, _themeColor)),
        backgroundColor: store.baseColor,
      ),
      body: GradientBody(store: store),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/image_picker'),
        tooltip: 'select gradient',
        backgroundColor: store.baseColor,
        child: Icon(Icons.check, color: _themeColor),
      ),
    );
  }
}

class GradientBody extends StatefulWidget {
  const GradientBody({Key key, this.store}) : super(key: key);

  final AppStore store;

  @override
  _GradientBodyState createState() => _GradientBodyState();
}

class _GradientBodyState extends State<GradientBody> {
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    if (widget.store.primary == null) {
      widget.store.setPrimary(
          _randomHsl(HSLColor.fromColor(widget.store.baseColor).hue).toColor());
      widget.store.setSecondary(_randomHsl().toColor());
      widget.store.setGradientBeginEnd(_randomGradientBeginEnd());
    }

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: widget.store.gradientBeginEnd.first,
          end: widget.store.gradientBeginEnd.last,
          colors: [
            widget.store.primary,
            widget.store.secondary,
          ],
          stops: const [
            0.0,
            1.0,
          ],
        ),
      ),
      child: InkWell(
          onTap: () => setState(() {
                widget.store.clearGradient();
              })),
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
