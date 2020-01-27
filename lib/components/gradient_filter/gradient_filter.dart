import 'package:flutter/material.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

import '../../app_store.dart';

class GradientFilter extends StatefulWidget {
  const GradientFilter({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  State<StatefulWidget> createState() => _GradientFilterState();
}

class _GradientFilterState extends State<GradientFilter> {
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
        child: ShaderMask(
          child: Image(
            image: FileImage(widget.store.bgImage),
          ),
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                widget.store.primary.withOpacity(0.6),
                widget.store.secondary.withOpacity(0.6),
              ],
              stops: const [
                0.0,
                1.0,
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
        ),
      )
    );
  }
}
