import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_to_you/components/color_palette/side_menu.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';
import 'package:gradient_to_you/utils/color_utils.dart';

import '../../app_store.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  //  Current State of InnerDrawerState
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  void _toggle() {
    _innerDrawerKey.currentState.toggle();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return InnerDrawer(
      key: _innerDrawerKey,
      onTapClose: true,
      leftAnimationType: InnerDrawerAnimation.quadratic,

      leftChild: SideMenu(
        store: widget.store,
      ),

      /// Color palette main widget
      scaffold: Scaffold(
        appBar: GradientAppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: _toggle,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            l10n.appName,
            style: AppThemeUtils.appBarStyle(widget.store.themeNo),
          ),
          backgroundColorStart:
              widget.store.gradientColors.first.withOpacity(0.6),
          backgroundColorEnd: widget.store.gradientColors.last.withOpacity(0.6),
        ),
        body: AnimationLimiter(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
//        childAspectRatio: 3 / 4,
            children: List.generate(
              12,
              (int index) {
                return Palette(position: index, store: widget.store);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Palette extends StatefulWidget {
  const Palette({Key key, @required this.position, @required this.store})
      : super(key: key);

  @override
  _PaletteState createState() => _PaletteState();

  final int position;
  final AppStore store;
}

class _PaletteState extends State<Palette> {
  @override
  Widget build(BuildContext context) {
    final _paletteHSLColor = _getHSLColor(widget.position);
    final _paletteColor = _paletteHSLColor.toColor();

    return AnimationConfiguration.staggeredGrid(
      duration: const Duration(milliseconds: 500),
      position: widget.position,
      columnCount: 3,
      child: ScaleAnimation(
        child: FadeInAnimation(
          child: Container(
            child: Card(
              color: _paletteColor,
              child: InkWell(
                onTap: () {
                  widget.store.setPaletteColor(_paletteHSLColor);
                  widget.store.clearGradient();
                  Navigator.of(context).pushNamed('/gradient');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  HSLColor _getHSLColor(int position) {
    switch (position) {
      case 0:
        {
          return ColorUtils.hslFromHue000;
        }
        break;
      case 1:
        {
          return ColorUtils.hslFromHue030;
        }
        break;
      case 2:
        {
          return ColorUtils.hslFromHue060;
        }
        break;
      case 3:
        {
          return ColorUtils.hslFromHue090;
        }
        break;
      case 4:
        {
          return ColorUtils.hslFromHue120;
        }
        break;
      case 5:
        {
          return ColorUtils.hslFromHue150;
        }
        break;
      case 6:
        {
          return ColorUtils.hslFromHue180;
        }
        break;
      case 7:
        {
          return ColorUtils.hslFromHue210;
        }
        break;

      case 8:
        {
          return ColorUtils.hslFromHue240;
        }
        break;

      case 9:
        {
          return ColorUtils.hslFromHue270;
        }
        break;

      case 10:
        {
          return ColorUtils.hslFromHue300;
        }
        break;

      case 11:
        {
          return ColorUtils.hslFromHue330;
        }
        break;

      default:
        {
          return ColorUtils.hslFromHue000;
        }
        break;
    }
  }
}
