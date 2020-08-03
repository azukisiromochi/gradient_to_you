import 'package:flutter/material.dart';

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
    return TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: _logoFontSize(no),
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily(no),
    );
  }

  static TextStyle appBarStyle(int no, [Color titleColor]) {
    return TextStyle(
      color: titleColor ?? Colors.white,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily(no),
    );
  }

  static String fontFamily(int no) {
    switch (no) {
      case 1:
        {
          return 'Charmonman';
        }
        break;

      case 2:
        {
          return 'Baloo Bhai 2';
        }
        break;

      case 3:
        {
          return 'Love Ya Like A Sister';
        }
        break;

      default:
        {
          return 'Charmonman';
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

    return style.copyWith(fontFamily: fontFamily);
  }
}
