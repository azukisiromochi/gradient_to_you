import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeUtils {
  static AssetImage splashImage(int no) {
    switch (no) {
      case 1:
        {
          return const AssetImage('assets/images/splash1.webp');
        }
        break;

      case 2:
        {
          return const AssetImage('assets/images/splash2.webp');
        }
        break;

      default:
        {
          return const AssetImage('assets/images/splash1.webp');
        }
        break;
    }
  }

  static List<Color> gradientColors(int no) {
    switch (no) {
      case 1:
        {
          return [
            const Color(0xffe4a972).withOpacity(0.6),
            const Color(0xff9941d8).withOpacity(0.6),
          ];
        }
        break;

      case 2:
        {
          return [
            const Color(0xffff5f6D).withOpacity(0.6),
            const Color(0xffffc371).withOpacity(0.6),
          ];
        }
        break;

      default:
        {
          return [
            const Color(0xffe4a972).withOpacity(0.6),
            const Color(0xff9941d8).withOpacity(0.6),
          ];
        }
        break;
    }
  }

  static TextStyle logoStyle(int no) {
    return googleFonts(no)(
      textStyle: const TextStyle(
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle appBarStyle(int no, [Color titleColor]) {
    return googleFonts(no)(
      textStyle: TextStyle(
        color: titleColor ?? Colors.white,
        decoration: TextDecoration.none,
      ),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle Function(
      {double fontSize,
      FontStyle fontStyle,
      FontWeight fontWeight,
      TextStyle textStyle}) googleFonts(int no) {
    switch (no) {
      case 1:
        {
          return GoogleFonts.charmonman;
        }
        break;

      case 2:
        {
          return GoogleFonts.balooBhai;
        }
        break;

      default:
        {
          return GoogleFonts.charmonman;
        }
        break;
    }
  }
}
