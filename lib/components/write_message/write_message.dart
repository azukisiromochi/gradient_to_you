import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_to_you/common/color_app_bar.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

import '../../app_store.dart';
import 'font_size_slider.dart';
import 'message.dart';

class WriteMessage extends StatelessWidget {
  const WriteMessage({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  Future<void> _exportToImage(GlobalKey _globalKey) async {
    final boundary =
        _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3);

    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    store.setPngImage(byteData);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final _globalKey = GlobalKey();
    final _themeColor = store.baseTextColor;

    final _textEditingController =
        TextEditingController(text: store.message ?? '');

    return Scaffold(
      appBar: ColorAppBar(store: store),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
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
                      Message(
                        store: store,
                        defaultMessage: l10n.messageDefault,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _InputItem(
                  icon: Icon(Icons.message, color: store.baseColor),
                  input: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      labelText: '',
                      hintText: l10n.hintText,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: store.baseColor),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: store.setMessage,
                  ),
                ),
                const SizedBox(height: 20),
                _InputItem(
                  icon: Icon(Icons.format_size, color: store.baseColor),
                  input: FontSizeSlider(store: store),
                ),
                const SizedBox(height: 20),
                _InputItem(
                  icon: Icon(Icons.text_format, color: store.baseColor),
                  input: Container(
                    height: 50,
                    child: const Placeholder(),
                  ),
                ),
              ],
            ),
          ),
        ],
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

class _InputItem extends StatelessWidget {
  const _InputItem({
    Key key,
    @required this.icon,
    @required this.input,
  }) : super(key: key);

  final Icon icon;
  final Widget input;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: icon,
        ),
        Expanded(
          flex: 4,
          child: Container(child: input),
        ),
      ],
    );
  }
}
