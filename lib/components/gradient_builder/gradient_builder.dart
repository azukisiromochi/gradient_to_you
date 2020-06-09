import 'package:flutter/material.dart';
import 'package:gradient_to_you/common/color_app_bar.dart';
import 'package:gradient_to_you/common/gradient_container.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/color_utils.dart';

import '../../app_store.dart';

class GradientBuilder extends StatelessWidget {
  const GradientBuilder({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    final themeColor = store.baseTextColor;

    return Scaffold(
      appBar: ColorAppBar(store: store),
      body: GradientBody(store: store),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/image_picker'),
        tooltip: l10n.tooltipTextSelectGradient,
        backgroundColor: store.baseColor,
        child: Icon(Icons.check, color: themeColor),
      ),
    );
  }
}

class GradientBody extends StatefulWidget {
  const GradientBody({Key key, this.store}) : super(key: key);

  final AppStore store;

  @override
  _GradientBodyState createState() => _GradientBodyState();
}

class _GradientBodyState extends State<GradientBody> {
  @override
  Widget build(BuildContext context) {
    if (widget.store.primary == null) {
      widget.store.setPrimary(
          ColorUtils.randomHsl(HSLColor.fromColor(widget.store.baseColor).hue)
              .toColor());
      widget.store.setSecondary(ColorUtils.randomHsl().toColor());
      widget.store.setGradientBeginEnd(ColorUtils.randomGradientBeginEnd());
    }

    return GradientContainer(
      store: widget.store,
      gradientBegin: widget.store.gradientBeginEnd.first,
      gradientEnd: widget.store.gradientBeginEnd.last,
      colors: [
        widget.store.primary,
        widget.store.secondary,
      ],
      child: InkWell(
        onTap: () => setState(() {
          widget.store.clearGradient();
        }),
      ),
    );
  }
}
