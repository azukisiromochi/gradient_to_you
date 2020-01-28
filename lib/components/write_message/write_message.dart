import 'package:flutter/material.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

import '../../app_store.dart';

class WriteMessage extends StatefulWidget {
  const WriteMessage({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  _WriteMessageState createState() => _WriteMessageState();
}

class _WriteMessageState extends State<WriteMessage> {
  @override
  Widget build(BuildContext context) {
    final _themeColor = widget.store.baseTextColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: _themeColor),
        title: Text('Gradient to you',
            style:
                AppThemeUtils.appBarStyle(widget.store.themeNo, _themeColor)),
        backgroundColor: widget.store.baseColor,
      ),
      body: Container(
        child: const Placeholder(),
      ),
    );
  }
}
