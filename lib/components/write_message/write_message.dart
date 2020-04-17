import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';
import 'package:mobx/mobx.dart';

import '../../app_store.dart';

class WriteMessage extends StatelessWidget {
  const WriteMessage({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  Future<void> _exportToImage(GlobalKey _globalKey) async {
    final boundary =
        _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3);

    // To PNG
    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    store.setPngImage(byteData);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final _globalKey = GlobalKey();

    store.setMessage(store.message ?? l10n.messageDefault);
    final _themeColor = store.baseTextColor;

    String _alignmentName;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: _themeColor),
        title: Text(l10n.appName,
            style: AppThemeUtils.appBarStyle(store.themeNo, _themeColor)),
        backgroundColor: store.baseColor,
      ),
      body: SingleChildScrollView(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: 4,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RepaintBoundary(
                  key: _globalKey,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: store.bgImageHeight.toDouble(),
                      width: store.bgImageWidth.toDouble(),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Center(child: store.gradientImage),
                        Message(store: store),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: '',
                      hintText: l10n.hintText,
                      icon: Icon(Icons.message, color: store.baseColor),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: store.baseColor),
                      ),
                    ),
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    onChanged: store.setMessage,
                  ),
                  AlignmentDropdown(store: store),
                  FontSizeSlider(store: store),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _exportToImage(_globalKey)
              .then((_) => Navigator.of(context).pushNamed('/save_or_share'));
        },
        tooltip: l10n.tooltipTextSetFilter,
        backgroundColor: store.baseColor,
        child: Icon(Icons.check, color: _themeColor),
      ),
    );
  }
}

class AlignmentDropdown extends StatefulWidget {
  const AlignmentDropdown({Key key, @required this.store}) : super(key: key);

  @override
  _AlignmentDropdownState createState() => _AlignmentDropdownState();

  final AppStore store;
}

class _AlignmentDropdownState extends State<AlignmentDropdown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: widget.store.alignmentName,
        hint: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.format_line_spacing,
              color: widget.store.baseColor,
            ),
            const SizedBox(width: 100),
            const Text('Message align'),
          ],
        ),
        underline: Container(
          width: double.infinity,
          height: 1,
          color: widget.store.baseColor,
        ),
        onChanged: (newValue) {
          setState(() {
            widget.store.setAlignment(newValue);
          });
        },
        items: <String>[
          'topLeft',
          'topCenter',
          'topRight',
          'centerLeft',
          'center',
          'centerRight',
          'bottomLeft',
          'bottomCenter',
          'bottomRight',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.format_line_spacing,
                  color: widget.store.baseColor,
                ),
                const SizedBox(width: 100),
                Text(value),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class FontSizeSlider extends StatefulWidget {
  const FontSizeSlider({Key key, @required this.store}) : super(key: key);

  @override
  _FontSizeSliderState createState() => _FontSizeSliderState();

  final AppStore store;
}

class _FontSizeSliderState extends State<FontSizeSlider> {
  void _changeSlider(double e) => setState(() {
        widget.store.setFontSize(e);
      });

  @override
  Widget build(BuildContext context) {
    final _fontSize = widget.store.fontSize ?? 20;

    return Slider(
      label: '${_fontSize.toStringAsFixed(2)}',
      min: 10,
      max: 100,
      value: _fontSize,
      activeColor: widget.store.baseColor,
      inactiveColor: widget.store.baseTextColor,
      divisions: 90,
      onChanged: _changeSlider,
    );
  }
}

class Message extends StatefulWidget {
  const Message({Key key, @required this.store}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();

  final AppStore store;
}

class _MessageState extends State<Message> {
  ReactionDisposer reactionDispose;

  String _message;
  Alignment _alignment;
  TextAlign _textAlign;
  double _fontSize;

  @override
  void initState() {
    super.initState();
    reactionDispose = autorun((_) => {
          setState(() {
            _message = widget.store.message;
            _alignment = widget.store.alignment;
            _textAlign = widget.store.textAlign;
            _fontSize = widget.store.fontSize;
          }),
        });
  }

  @override
  void dispose() {
    super.dispose();
    reactionDispose();
  }

  @override
  Widget build(BuildContext context) {
    _message = widget.store.message;
    _alignment = widget.store.alignment ?? Alignment.center;
    _textAlign = widget.store.textAlign ?? TextAlign.center;
    _fontSize = widget.store.fontSize;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: _alignment,
          child: Text(
            _message,
            textAlign: _textAlign,
            style: TextStyle(
              color: Colors.white,
              fontSize: _fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
