import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_to_you/common/color_app_bar.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

import '../../app_store.dart';
import 'input_bottom_bar.dart';
import 'message.dart';

class WriteMessage extends StatelessWidget {
  const WriteMessage({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final globalKey = GlobalKey();
    final themeColor = store.baseTextColor;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: ColorAppBar(store: store),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
              child: RepaintBoundary(
                key: globalKey,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 400,
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _exportToImage(globalKey)
            .then((_) => Navigator.of(context).pushNamed('/save_or_share')),
        tooltip: l10n.tooltipTextSetFilter,
        backgroundColor: store.baseColor,
        child: Icon(Icons.check, color: themeColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: InputBottomBar(store: store, l10n: l10n),
    );
  }

  Future<void> _exportToImage(GlobalKey globalKey) async {
    final boundary =
        globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3);

    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    store.setPngImage(byteData);
  }
}
