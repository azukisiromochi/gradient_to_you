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
  String _text = 'Enter something...';

  void _messageChanged(String value) {
    setState(() {
      _text = '$value';
    });
  }

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
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: 4,
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
                maxHeight: 432,
              ),
              child: Stack(
                children: <Widget>[
                  widget.store.gradientImage,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      _text,
                      style: AppThemeUtils.logoStyle(widget.store.themeNo),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  hintText: 'Message',
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
      ),
    );
  }
}
