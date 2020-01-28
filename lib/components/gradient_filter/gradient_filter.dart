import 'package:flutter/material.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

import '../../app_store.dart';

class GradientFilter extends StatefulWidget {
  const GradientFilter({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  _GradientFilterState createState() => _GradientFilterState();
}

class _GradientFilterState extends State<GradientFilter> {
  void _changeSlider(double e) => setState(() {
        widget.store.setOpacity(e);
      });

  @override
  Widget build(BuildContext context) {
    final _opacity = widget.store.opacity ?? 0.6;

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ShaderMask(
              child: Image(
                image: FileImage(widget.store.bgImage),
              ),
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: widget.store.gradientBeginEnd.first,
                  end: widget.store.gradientBeginEnd.last,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/write_message');
        },
        tooltip: 'select gradient',
        backgroundColor: widget.store.baseColor,
        child: Icon(Icons.check, color: _themeColor),
      ),
    );
  }
}
