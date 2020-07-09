import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

typedef SizeChangedCallback = void Function(Size size);

class SizeListenableContainer extends SingleChildRenderObjectWidget {
  const SizeListenableContainer({
    Key key,
    Widget child,
    @required this.onSizeChanged,
  })  : assert(onSizeChanged != null),
        super(key: key, child: child);

  final SizeChangedCallback onSizeChanged;

  @override
  _SizeListenableRenderObject createRenderObject(BuildContext context) {
    return _SizeListenableRenderObject(onSizeChanged: onSizeChanged);
  }
}

class _SizeListenableRenderObject extends RenderProxyBox {
  _SizeListenableRenderObject({
    RenderBox child,
    @required this.onSizeChanged,
  })  : assert(onSizeChanged != null),
        super(child);

  final SizeChangedCallback onSizeChanged;

  Size _oldSize;

  @override
  void performLayout() {
    super.performLayout();

    final newSize = size;
    if (newSize != _oldSize) {
      _oldSize = newSize;
      _callback(newSize);
    }
  }

  void _callback(Size size) {
    SchedulerBinding.instance.addPostFrameCallback((Duration _) {
      onSizeChanged(size);
    });
  }
}
