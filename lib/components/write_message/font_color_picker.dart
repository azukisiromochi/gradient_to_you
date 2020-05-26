import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

import '../../app_store.dart';

class FontColorPicker extends StatefulWidget {
  const FontColorPicker({Key key, @required this.store}) : super(key: key);

  @override
  _FontColorPickerState createState() => _FontColorPickerState();

  final AppStore store;
}

class _FontColorPickerState extends State<FontColorPicker> {
  Color _fontColor;

  void _changeColor(Color color) => setState(() => _fontColor = color);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    _fontColor = _fontColor ?? widget.store.fontColor;

    return Center(
      child: RaisedButton(
        elevation: 2,
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(l10n.fontColorPickerTitle),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: _fontColor,
                    onColorChanged: _changeColor,
                    showLabel: true,
                    pickerAreaHeightPercent: 0.8,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(l10n.fontColorPickerButton),
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
          child: Text(l10n.fontColorPicker),
        ),
        color: _fontColor,
        textColor: useWhiteForeground(_fontColor)
            ? const Color(0xffffffff)
            : const Color(0xff000000),
      ),
    );
  }
}
