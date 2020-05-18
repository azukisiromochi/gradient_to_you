import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../app_store.dart';

class FontColorPicker extends StatefulWidget {
  const FontColorPicker({Key key, @required this.store}) : super(key: key);

  @override
  _FontColorPickerState createState() => _FontColorPickerState();

  final AppStore store;
}

class _FontColorPickerState extends State<FontColorPicker> {
  Color _fontColor;

  void changeColor(Color color) => setState(() => _fontColor = color);

  @override
  Widget build(BuildContext context) {
    _fontColor = _fontColor ?? widget.store.fontColor;
    print(widget.store.fontColor);

    return Center(
      child: RaisedButton(
        elevation: 2,
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('Pick a color!'),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: _fontColor,
                    onColorChanged: changeColor,
                    showLabel: true,
                    pickerAreaHeightPercent: 0.8,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: const Text('Got it'),
                    onPressed: () {
                      widget.store.setFontColor(_fontColor);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          width: double.infinity,
          child: const Text('Change me'),
        ),
        color: _fontColor,
        textColor: useWhiteForeground(_fontColor)
            ? const Color(0xffffffff)
            : const Color(0xff000000),
      ),
    );
  }
}
