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

    store.message = store.message ?? l10n.messageDefault;
    final _themeColor = store.baseTextColor;

    String dropdownValue;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: _themeColor),
        title: Text(l10n.appName,
            style: AppThemeUtils.appBarStyle(store.themeNo, _themeColor)),
        backgroundColor: store.baseColor,
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
              spacing: 8,
              runSpacing: 4,
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
                  onChanged: (String value) {
                    store.message = '$value';
                  },
                ),
                Center(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    hint: const Text('Message align'),
                    icon:
                        Icon(Icons.format_line_spacing, color: store.baseColor),
                    underline: Container(
                      width: double.infinity,
                      height: 1,
                      color: store.baseColor,
                    ),
                    onChanged: (String newValue) {
                      dropdownValue = newValue;
                    },
                    items: <String>['bottomCenter', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
              .then((_) => Navigator.of(context).pushNamed('/share'));
        },
        tooltip: l10n.tooltipTextSetFilter,
        backgroundColor: store.baseColor,
        child: Icon(Icons.check, color: _themeColor),
      ),
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

  @override
  void initState() {
    super.initState();
    reactionDispose = reaction(
      (_) => widget.store.message,
      (String message) => setState(() {}),
    );
  }

  @override
  void dispose() {
    super.dispose();
    reactionDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            widget.store.message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
