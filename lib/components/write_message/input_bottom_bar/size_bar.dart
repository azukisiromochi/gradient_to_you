import 'package:flutter/material.dart';
import 'package:gradient_to_you/app_store.dart';
import 'package:gradient_to_you/common/input_item.dart';

class SizeBar extends StatelessWidget {
  const SizeBar({Key key, this.store}) : super(key: key);
  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final fontSize = store.fontSize ?? 20;
    final degrees = store.rotatedDegrees ?? 0;

    return Column(
      children: <Widget>[
        InputItem(
          icon: Icon(Icons.format_size, color: store.baseColor),
          input: _FontSizeSlider(store: store),
        ),
        const SizedBox(height: 20),
        InputItem(
          icon: Icon(
            Icons.text_rotation_angledown,
            color: store.baseColor,
          ),
          input: _RotationSlider(store: store),
        ),
      ],
    );
  }
}

class _FontSizeSlider extends StatefulWidget {
  const _FontSizeSlider({Key key, @required this.store}) : super(key: key);

  @override
  _FontSizeSliderState createState() => _FontSizeSliderState();

  final AppStore store;
}

class _FontSizeSliderState extends State<_FontSizeSlider> {
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

class _RotationSlider extends StatefulWidget {
  const _RotationSlider({Key key, @required this.store}) : super(key: key);

  @override
  _RotationSliderState createState() => _RotationSliderState();

  final AppStore store;
}

class _RotationSliderState extends State<_RotationSlider> {
  @override
  Widget build(BuildContext context) {
    final degrees = widget.store.rotatedDegrees ?? 0;

    return Slider(
      label: '${degrees.toStringAsFixed(0)}',
      min: -90,
      max: 90,
      value: degrees,
      activeColor: widget.store.baseColor,
      inactiveColor: widget.store.baseTextColor,
      divisions: 181,
      onChanged: _changeSlider,
    );
  }

  void _changeSlider(double e) => setState(() {
        widget.store.setRotatedDegrees(e);
      });
}
