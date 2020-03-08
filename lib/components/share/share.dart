import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

import '../../app_store.dart';

class Share extends StatelessWidget {

  const Share({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text(
          l10n.appName,
          style: AppThemeUtils.appBarStyle(store.themeNo),
        ),
        backgroundColorStart: store.gradientColors.first.withOpacity(0.6),
        backgroundColorEnd: store.gradientColors.last.withOpacity(0.6),
      ),
      body: Placeholder()
    );
  }

}