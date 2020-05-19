import 'package:flutter/material.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

import '../../app_store.dart';

class FontFamilyDropdown extends StatefulWidget {
  const FontFamilyDropdown({Key key, @required this.store}) : super(key: key);

  @override
  _FontFamilyDropdownState createState() => _FontFamilyDropdownState();

  final AppStore store;
}

class _FontFamilyDropdownState extends State<FontFamilyDropdown> {
  final _dropdownItems = const <String>[
    'sans-serif',
    'sans-serif-condensed',
    'serif',
    'monospace',
    'serif-monospace',
    'casual',
    'cursive',
    'sans-serif-smallcaps',
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
              items: _dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
//                    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontFamily: value),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
