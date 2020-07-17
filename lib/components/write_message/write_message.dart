import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:gradient_to_you/common/color_app_bar.dart';
import 'package:gradient_to_you/components/write_message/input_bottom_bar.dart';
import 'package:gradient_to_you/components/write_message/message.dart';

import '../../app_store.dart';
import '../importer.dart';

class WriteMessage extends StatelessWidget {
  const WriteMessage({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
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
        onPressed: () => _exportToImage(globalKey).then(
            (_) => Navigator.of(context).pushNamed(Screen.saveOrShare.url)),
        tooltip: store.l10n.tooltipTextSetFilter,
        backgroundColor: store.baseColor,
        child: Icon(Icons.check, color: themeColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: InputBottomBar(store: store),
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
