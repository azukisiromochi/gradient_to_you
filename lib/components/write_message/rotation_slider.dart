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
    final _degrees = widget.store.rotatedDegrees ?? 0;

    return Slider(
      label: '${_degrees.toStringAsFixed(2)}',
      min: -180,
      max: 180,
      value: _degrees,
      activeColor: widget.store.baseColor,
      inactiveColor: widget.store.baseTextColor,
      divisions: 360,
      onChanged: _changeSlider,
    );
  }
}
