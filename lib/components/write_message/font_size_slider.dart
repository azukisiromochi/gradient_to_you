import 'package:flutter/material.dart';

import '../../app_store.dart';

class FontSizeSlider extends StatefulWidget {
  const FontSizeSlider({Key key, @required this.store}) : super(key: key);

  @override
  _FontSizeSliderState createState() => _FontSizeSliderState();

  final AppStore store;
}

class _FontSizeSliderState extends State<FontSizeSlider> {
  @override
  Widget build(BuildContext context) {
    final fontSize = widget.store.fontSize ?? 20;

    return Slider(
      label: '${fontSize.toStringAsFixed(2)}',
      min: 5,
      max: 100,
      value: fontSize,
      activeColor: widget.store.baseColor,
      inactiveColor: widget.store.baseTextColor,
      divisions: 95,
      onChanged: _changeSlider,
    );
  }

  void _changeSlider(double e) => setState(() {
        widget.store.setFontSize(e);
      });
}
