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
  double _opacity = 0.6;

  void _changeSlider(double e) => setState(() {
        _opacity = e;
      });

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
        child: Column(
          children: <Widget>[
            Container(
              child: ShaderMask(
                child: Image(
                  image: FileImage(widget.store.bgImage),
                ),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      widget.store.primary.withOpacity(_opacity),
                      widget.store.secondary.withOpacity(_opacity),
                    ],
                    stops: const [
                      0.0,
                      1.0,
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            Slider(
              label: '${_opacity.toStringAsFixed(2)}',
              min: 0.1,
              max: 0.9,
              value: _opacity,
              activeColor: widget.store.baseColor,
              inactiveColor: _themeColor,
              divisions: 80,
              onChanged: _changeSlider,
            )
          ],
        ),
      )
    );
  }
}
