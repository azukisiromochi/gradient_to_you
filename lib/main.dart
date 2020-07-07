import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/app.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}
