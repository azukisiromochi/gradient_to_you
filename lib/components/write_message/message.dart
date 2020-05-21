import 'package:angles/angles.dart';
import 'package:flutter/material.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:mobx/mobx.dart';

import '../../app_store.dart';

class Message extends StatefulWidget {
  const Message({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  _MessageState createState() => _MessageState();

  final AppStore store;
}

class _MessageState extends State<Message> {
  ReactionDisposer reactionDispose;

  String _message;
  Offset _offset;
  TextStyle _style;

  @override
  void initState() {
    super.initState();
    reactionDispose = autorun(
      (_) => {
        setState(() {
          _message = widget.store.message;
          _offset = widget.store.offset;
          _style = widget.store.textStyle;
        }),
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    reactionDispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    _message = widget.store.message ?? l10n.messageDefault;
    _offset = widget.store.offset ?? const Offset(100, 20);
    _style = widget.store.textStyle;

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
//          transform: Matrix4.rotationZ(const Angle.fromDegrees(90).radians),
          child: Text(
            _message,
            style: _style,
          ),
        ),
      ),
    );
  }
}
