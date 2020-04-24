import 'dart:math' show Random;

import 'package:flutter/material.dart';

class ColorUtils {
  static const double lightness = 0.7;
  static const double saturation = 0.9;

  static const HSLColor hslFromHue000 =
  HSLColor.fromAHSL(1, 0, saturation, lightness);
  static const HSLColor hslFromHue030 =
  HSLColor.fromAHSL(1, 30, saturation, lightness);
  static const HSLColor hslFromHue060 =
  HSLColor.fromAHSL(1, 60, saturation, lightness);
  static const HSLColor hslFromHue090 =
  HSLColor.fromAHSL(1, 90, saturation, lightness);
  static const HSLColor hslFromHue120 =
  HSLColor.fromAHSL(1, 120, saturation, lightness);
  static const HSLColor hslFromHue150 =
  HSLColor.fromAHSL(1, 150, saturation, lightness);
  static const HSLColor hslFromHue180 =
  HSLColor.fromAHSL(1, 180, saturation, lightness);
  static const HSLColor hslFromHue210 =
  HSLColor.fromAHSL(1, 210, saturation, lightness);
  static const HSLColor hslFromHue240 =
  HSLColor.fromAHSL(1, 240, saturation, lightness);
  static const HSLColor hslFromHue270 =
  HSLColor.fromAHSL(1, 270, saturation, lightness);
  static const HSLColor hslFromHue300 =
  HSLColor.fromAHSL(1, 300, saturation, lightness);
  static const HSLColor hslFromHue330 =
  HSLColor.fromAHSL(1, 330, saturation, lightness);

  static List<FractionalOffset> randomGradientBeginEnd() {
    switch (Random().nextInt(6)) {
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

  static HSLColor randomHsl([double hue]) {
    return HSLColor.fromAHSL(
        1, randomHue(hue), randomSaturation(), randomLightness());
  }

  static double randomHue([double hue]) {
    final _random = Random();
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

  static double randomSaturation() {
    final _random = Random();
    var d = _random.nextDouble();
    while (d < 0.2) {
      d = _random.nextDouble();
    }
    return d;
  }

  static double randomLightness() {
    final _random = Random();
    var d = _random.nextDouble();
    while (d < 0.1 || 0.9 < d) {
      d = _random.nextDouble();
    }
    return d;
  }
}
