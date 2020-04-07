import 'package:flutter/material.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
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
    final l10n = L10n.of(context);

    final _opacity = widget.store.opacity;
    final _themeColor = widget.store.baseTextColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: _themeColor),
        title: Text(l10n.appName,
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
                maxHeight: 400,
              ),
              child: Center(child: widget.store.gradientImage),
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/write_message');
        },
        tooltip: l10n.tooltipTextSetFilter,
        backgroundColor: widget.store.baseColor,
        child: Icon(Icons.check, color: _themeColor),
      ),
    );
  }
}
