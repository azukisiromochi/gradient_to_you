import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

part 'app_theme_store.g.dart';

class AppThemeStore = _AppThemeStore with _$AppThemeStore;

abstract class _AppThemeStore with Store {
  @observable
  int themeNo;

  @observable
  AssetImage splashImage;

  @observable
  List<Color> gradientColors;

  @observable
  TextStyle logoStyle;

  @observable
  TextStyle appBarStyle;

  @action
  Future<int> get() async {
    themeNo = await _getThemeNo();
    splashImage = AppThemeUtils.splashImage(themeNo);
    gradientColors = AppThemeUtils.gradientColors(themeNo);
    logoStyle = AppThemeUtils.logoStyle(themeNo);
    appBarStyle = AppThemeUtils.appBarStyle(themeNo);

    unawaited(_persistThemeNo());
    return 0;
  }

  Future<void> _persistThemeNo() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt('themeNo', themeNo);
  }

  Future<int> _getThemeNo() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt('themeNo') ?? Random().nextInt(2) + 1;
  }

  void unawaited(Future<void> future) {}
}
