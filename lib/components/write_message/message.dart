import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../app_store.dart';

class Message extends StatefulWidget {
  const Message({
    Key key,
    @required this.store,
    this.defaultMessage,
  }) : super(key: key);

  @override
  _MessageState createState() => _MessageState();

  final AppStore store;
  final String defaultMessage;
}

class _MessageState extends State<Message> {
  ReactionDisposer reactionDispose;

  String _message;
  double _fontSize;
  Color _fontColor;
  String _fontFamily;
  Offset _offset;

  @override
  void initState() {
    super.initState();
    reactionDispose = autorun((_) => {
      setState(() {
        _message = widget.store.message;
        _fontSize = widget.store.fontSize;
        _fontColor= widget.store.fontColor;
        _fontFamily =widget.store.fontFamily;
        _offset = widget.store.offset;
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
    _message = widget.store.message ?? widget.defaultMessage;
    _fontSize = widget.store.fontSize;
    _fontColor= widget.store.fontColor ?? Colors.white;
    _fontFamily = widget.store.fontFamily;
    _offset = widget.store.offset ?? const Offset(100, 20);

    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanUpdate: (details) {
          widget.store.setOffset(Offset(
            _offset.dx + details.delta.dx,
            _offset.dy + details.delta.dy,
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            _message,
            style: TextStyle(
              fontFamily: _fontFamily,
              color: _fontColor,
              fontSize: _fontSize,
            ),
          ),
        ),
      ),
    );
  }
}