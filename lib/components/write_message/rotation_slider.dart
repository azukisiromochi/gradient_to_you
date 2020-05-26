import 'package:flutter/material.dart';

import '../../app_store.dart';

class RotationSlider extends StatefulWidget {
  const RotationSlider({Key key, @required this.store}) : super(key: key);

  @override
  _RotationSliderState createState() => _RotationSliderState();

  final AppStore store;
}

class _RotationSliderState extends State<RotationSlider> {
  void _changeSlider(double e) => setState(() {
        widget.store.setRotatedDegrees(e);
      });

  @override
  Widget build(BuildContext context) {
    final degrees = widget.store.rotatedDegrees ?? 0;

    return Slider(
      label: '${degrees.toStringAsFixed(0)}',
      min: -180,
      max: 180,
      value: degrees,
      activeColor: widget.store.baseColor,
      inactiveColor: widget.store.baseTextColor,
      divisions: 361,
      onChanged: _changeSlider,
    );
  }
}
