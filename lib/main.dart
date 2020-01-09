import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gradient to you',
        home: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash1.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [
                    const Color(0xffe4a972).withOpacity(0.6),
                    const Color(0xff9941d8).withOpacity(0.6),
                  ],
                  stops: const [
                    0.0,
                    1.0,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Gradient to you',
                style: GoogleFonts.charmonman(
                  textStyle: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
