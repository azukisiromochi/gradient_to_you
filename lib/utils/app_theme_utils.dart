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

      case 3:
        {
          return const AssetImage('assets/images/splash3.webp');
        }
        break;

      default:
        {
          return const AssetImage('assets/images/splash1.webp');
        }
        break;
    }
  }

  static AssetImage thumbnailImage(int no) {
    switch (no) {
      case 1:
        {
          return const AssetImage('assets/images/thumbnail1.webp');
        }
        break;

      case 2:
        {
          return const AssetImage('assets/images/thumbnail2.webp');
        }
        break;

      case 3:
        {
          return const AssetImage('assets/images/thumbnail3.webp');
        }
        break;

      default:
        {
          return const AssetImage('assets/images/thumbnail1.webp');
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

      case 3:
        {
          return [
            const Color(0xff2af598).withOpacity(0.6),
            const Color(0xff009efd).withOpacity(0.6),
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
      fontSize: _logoFontSize(no),
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

      case 3:
        {
          return GoogleFonts.loveYaLikeASister;
        }
        break;

      default:
        {
          return GoogleFonts.charmonman;
        }
        break;
    }
  }

  static double _logoFontSize(int no) {
    switch (no) {
      case 1:
        {
          return 40;
        }
        break;

      case 2:
        {
          return 32;
        }
        break;

      case 3:
        {
          return 32;
        }
        break;

      default:
        {
          return 40;
        }
        break;
    }
  }

  static TextStyle messageStyleBy(
    String fontFamily,
    double fontSize,
    Color fontColor,
  ) {
    final style = TextStyle(
      fontSize: fontSize,
      color: fontColor ?? Colors.white,
    );

    if (fontFamily == 'Sawarabi Gothic') {
      return GoogleFonts.sawarabiGothic(textStyle: style);
    }
    if (fontFamily == 'Noto Serif JP') {
      return GoogleFonts.notoSerifJP(textStyle: style);
    }
    if (fontFamily == 'Kosugi Maru') {
      return GoogleFonts.kosugiMaru(textStyle: style);
    }

    return style.copyWith(fontFamily: fontFamily);
  }
}
