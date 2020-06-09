import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_to_you/app_store.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

class MyGradientAppBar extends GradientAppBar {
  MyGradientAppBar({
    @required this.store,
    @required this.appName,
    this.leadingWidget,
  })  : super(
    leading: leadingWidget,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    centerTitle: true,
    title: Text(
      appName,
      style: AppThemeUtils.appBarStyle(store.themeNo),
    ),
    backgroundColorStart: store.gradientColors.first.withOpacity(0.6),
    backgroundColorEnd: store.gradientColors.last.withOpacity(0.6),
  );

  final AppStore store;
  final String appName;
  final Widget leadingWidget;

}
