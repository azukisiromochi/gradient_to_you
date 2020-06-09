import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/icon/icon.png'),
        ),
      ),
    );
  }
}
