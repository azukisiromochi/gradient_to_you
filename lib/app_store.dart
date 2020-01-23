import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  _AppStore(this.themeNo)
      : gradientColors = AppThemeUtils.gradientColors(themeNo);

  @observable
  int themeNo;

  @observable
  List<Color> gradientColors;

  @observable
  Color baseColor;

  // ignore: use_setters_to_change_properties
  @action
  void setBaseColor(Color value) {
    baseColor = value;
  }
}
