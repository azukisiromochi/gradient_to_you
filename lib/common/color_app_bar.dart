import 'package:flutter/material.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

import '../app_store.dart';

class ColorAppBar extends StatefulWidget implements PreferredSizeWidget {
  ColorAppBar({Key key, @required this.store, this.actions})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  final AppStore store;
  final List<Widget> actions;

  @override
  _ColorAppBarState createState() => _ColorAppBarState();

  @override
  final Size preferredSize;
}

class _ColorAppBarState extends State<ColorAppBar> {
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: widget.store.baseTextColor),
      title: Text(
        l10n.appName,
        style: AppThemeUtils.appBarStyle(
            widget.store.themeNo, widget.store.baseTextColor),
      ),
      backgroundColor: widget.store.baseColor,
      actions: widget.actions,
    );
  }
}
