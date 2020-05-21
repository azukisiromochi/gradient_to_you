import 'package:angles/angles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/size_listenable_container.dart';
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
  double _rotation;

  Size _size;

  @override
  void initState() {
    super.initState();
    reactionDispose = autorun(
      (_) => {
        setState(() {
          _message = widget.store.message;
          _offset = widget.store.offset;
          _style = widget.store.textStyle;
          _rotation = widget.store.rotation;
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
    _rotation = widget.store.rotation ?? 0;

    double boxWidth;
    double boxHeight;
    if (_size != null) {
      boxWidth = _rotatedWidth(_size.width, _size.height, _rotation);
      boxHeight = _rotatedHeight(_size.width, _size.height, _rotation);
    }
    print('width' + boxWidth.toString());
    print('height' + boxHeight.toString());

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
          color: Colors.blue,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                width: boxWidth,
                height: boxHeight,
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(_degrees2radians(_rotation)),
                child: SizeListenableContainer(
                  onSizeChanged: (Size size) {
                    _size = size;
                  },
                  child: Text(
                    _message,
                    style: _style,
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }

  double _degrees2radians(double degrees) => Angle.fromDegrees(degrees).radians;

  double _rotatedWidth(double x, double y, double degrees) {
    final angle = Angle.fromDegrees(degrees);
    return x * angle.cos + y * angle.sin;
  }

  double _rotatedHeight(double x, double y, double degrees) {
    final angle = Angle.fromDegrees(degrees);
    return x * angle.sin + y * angle.cos;
  }
}
