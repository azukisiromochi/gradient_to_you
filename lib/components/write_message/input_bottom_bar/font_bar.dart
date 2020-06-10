import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_to_you/app_store.dart';
import 'package:gradient_to_you/common/input_item.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

class FontBar extends StatelessWidget {
  const FontBar({Key key, this.store}) : super(key: key);
  final AppStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputItem(
          icon: Icon(Icons.text_format, color: store.baseColor),
          input: _FontFamilyDropdown(store: store),
        ),
        const SizedBox(height: 20),
        InputItem(
          icon: Icon(Icons.color_lens, color: store.baseColor),
          input: _FontColorPicker(store: store),
        ),
      ],
    );
  }
}

class _FontFamilyDropdown extends StatefulWidget {
  const _FontFamilyDropdown({Key key, @required this.store}) : super(key: key);

  @override
  _FontFamilyDropdownState createState() => _FontFamilyDropdownState();

  final AppStore store;
}

class _FontFamilyDropdownState extends State<_FontFamilyDropdown> {
  final _dropdownItems = const <String>[
    'sans-serif',
    'sans-serif-condensed',
    'serif',
    'monospace',
    'serif-monospace',
    'casual',
    'cursive',
    'sans-serif-smallcaps',
    'Sawarabi Gothic',
    'Noto Serif JP',
    'Kosugi Maru',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelStyle: TextStyle(fontFamily: widget.store.fontFamily),
            hintText: l10n.fontFamilyDropdownHintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: widget.store.baseColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: widget.store.baseTextColor),
            ),
          ),
          isEmpty: widget.store.fontFamily == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: widget.store.fontFamily,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  widget.store.setFontFamily(newValue);
                });
              },
              items: _dropdownItems.map(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      _convertToDisplayName(l10n, value),
//                    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: _styleBy(value),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }

  String _convertToDisplayName(L10n l10n, String fontFamily) {
    if (fontFamily == 'Sawarabi Gothic') {
      return l10n.googleFontsSawarabiGothic;
    }
    if (fontFamily == 'Noto Serif JP') {
      return l10n.googleFontsNotoSerifJP;
    }
    if (fontFamily == 'Kosugi Maru') {
      return l10n.googleFontsKosugiMaru;
    }
    return fontFamily;
  }

  TextStyle _styleBy(String fontFamily) {
    if (fontFamily == 'Sawarabi Gothic') {
      return GoogleFonts.sawarabiGothic();
    }
    if (fontFamily == 'Noto Serif JP') {
      return GoogleFonts.notoSerifJP();
    }
    if (fontFamily == 'Kosugi Maru') {
      return GoogleFonts.kosugiMaru();
    }
    return TextStyle(fontFamily: fontFamily);
  }
}

class _FontColorPicker extends StatefulWidget {
  const _FontColorPicker({Key key, @required this.store}) : super(key: key);

  @override
  _FontColorPickerState createState() => _FontColorPickerState();

  final AppStore store;
}

class _FontColorPickerState extends State<_FontColorPicker> {
  Color _fontColor;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    _fontColor = _fontColor ?? widget.store.fontColor;

    return Center(
      child: RaisedButton(
        elevation: 2,
        onPressed: () => _openColorPicker(
            colorPickerTitle: l10n.fontColorPickerTitle,
            colorPickerButtonText: l10n.fontColorPickerButton),
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

  void _changeColor(Color color) => setState(() => _fontColor = color);

  void _openColorPicker(
      {String colorPickerTitle, String colorPickerButtonText}) {
    showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(colorPickerTitle),
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
              child: Text(colorPickerButtonText),
              onPressed: () {
                widget.store.setFontColor(_fontColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
