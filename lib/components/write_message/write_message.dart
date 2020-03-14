import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

import '../../app_store.dart';

class WriteMessage extends StatefulWidget {
  const WriteMessage({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  _WriteMessageState createState() => _WriteMessageState();
}

class _WriteMessageState extends State<WriteMessage> {
  final GlobalKey _globalKey = GlobalKey();
  String _text;

  void _messageChanged(String value) {
    setState(() {
      _text = '$value';
    });
  }

  Future<void> _exportToImage() async {
    final boundary =
        _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3);

    // To PNG
    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    widget.store.setPngImage(byteData);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    //TODO: テキスト部分のみ state を更新するように widget 分割すること.
    _text = _text ?? l10n.messageDefault;
    final _themeColor = widget.store.baseTextColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: _themeColor),
        title: Text(l10n.appName,
            style:
                AppThemeUtils.appBarStyle(widget.store.themeNo, _themeColor)),
        backgroundColor: widget.store.baseColor,
      ),
      body: Wrap(
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
                    height: widget.store.bgImageHeight.toDouble(),
                    width: widget.store.bgImageWidth.toDouble(),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(child: widget.store.gradientImage),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              _text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextField(
              decoration: InputDecoration(
                labelText: '',
                hintText: l10n.hintText,
                icon: Icon(Icons.message),
              ),
              autocorrect: false,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _messageChanged,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _exportToImage()
              .then((_) => Navigator.of(context).pushNamed('/share'));
        },
        tooltip: l10n.tooltipTextSetFilter,
        backgroundColor: widget.store.baseColor,
        child: Icon(Icons.check, color: _themeColor),
      ),
    );
  }
}
