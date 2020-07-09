import 'package:angles/angles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'file:///C:/Users/kuramoto/Documents/workspace/github.com/azukisiromochi/gradient_to_you/lib/common/size_listenable_container.dart';
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
  ReactionDisposer _reactionDispose;

  String _message;
  Offset _offset;
  TextStyle _style;
  double _degrees;

  Size _size;

  @override
  void initState() {
    super.initState();
    _reactionDispose = autorun(
      (_) => {
        setState(() {
          _message = widget.store.message;
          _offset = widget.store.offset;
          _style = widget.store.textStyle;
          _degrees = widget.store.rotatedDegrees;
        }),
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _reactionDispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    _message = widget.store.message ?? l10n.messageDefault;
    _offset = widget.store.offset ?? const Offset(80, 180);
    _style = widget.store.textStyle;
    _degrees = widget.store.rotatedDegrees ?? 0;

    double rotatedWidth;
    double rotatedHeight;
    if (_size != null) {
      rotatedWidth = _calcRotatedWidth(_size.width, _size.height, _degrees);
      rotatedHeight = _calcRotatedHeight(_size.width, _size.height, _degrees);
    }

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
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: rotatedWidth,
                height: rotatedHeight,
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(_degrees2radians(_degrees)),
                child: SizeListenableContainer(
                  onSizeChanged: (Size size) {
                    _size = size;
                  },
                  child: Text(
                    _message,
                    style: _style,
                    textAlign: TextAlign.center,
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

  double _calcRotatedWidth(double x, double y, double degrees) {
    var angle = Angle.fromDegrees(degrees);
    final w = x * angle.cos + y * angle.sin;
    if (w > 0) {
      return w;
    }
    angle = Angle.fromDegrees(degrees - 180);
    return x * angle.cos + y * angle.sin;
  }

  double _calcRotatedHeight(double x, double y, double degrees) {
    var angle = Angle.fromDegrees(degrees);
    final h = x * angle.sin + y * angle.cos;
    if (h > 0) {
      return h;
    }
    angle = Angle.fromDegrees(degrees - 180);
    return x * angle.sin + y * angle.cos;
  }
}
