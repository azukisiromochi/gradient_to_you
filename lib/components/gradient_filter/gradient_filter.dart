import 'package:flutter/material.dart';
import 'package:gradient_to_you/common/color_app_bar.dart';
import 'package:gradient_to_you/l10n/l10n.dart';

import '../../app_store.dart';

class GradientFilter extends StatefulWidget {
  const GradientFilter({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  _GradientFilterState createState() => _GradientFilterState();
}

class _GradientFilterState extends State<GradientFilter> {
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    final opacity = widget.store.opacity;
    final themeColor = widget.store.baseTextColor;

    return Scaffold(
      appBar: ColorAppBar(store: widget.store),
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
              label: '${opacity.toStringAsFixed(2)}',
              min: 0.1,
              max: 0.9,
              value: opacity,
              activeColor: widget.store.baseColor,
              inactiveColor: themeColor,
              divisions: 80,
              onChanged: _changeSlider,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/write_message'),
        tooltip: l10n.tooltipTextSetFilter,
        backgroundColor: widget.store.baseColor,
        child: Icon(Icons.check, color: themeColor),
      ),
    );
  }

  void _changeSlider(double newValue) => setState(() {
        widget.store.setOpacity(newValue);
      });
}
