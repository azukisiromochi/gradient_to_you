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
        widget.store.setRotation(e);
      });

  @override
  Widget build(BuildContext context) {
    final _rotation = widget.store.rotation ?? 0;

    return Slider(
      label: '${_rotation.toStringAsFixed(2)}',
      min: -180,
      max: 180,
      value: _rotation,
      activeColor: widget.store.baseColor,
      inactiveColor: widget.store.baseTextColor,
      divisions: 360,
      onChanged: _changeSlider,
    );
  }
}
