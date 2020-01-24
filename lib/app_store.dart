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
  HSLColor paletteColor = HSLColor.fromColor(Colors.black);

  @observable
  Color primary;

  @observable
  Color secondary;

  @observable
  List<FractionalOffset> gradientBeginEnd;

  @computed
  Color get baseColor => paletteColor?.toColor() ?? Colors.black;

  // ignore: use_setters_to_change_properties
  @action
  void setPaletteColor(HSLColor value) {
    paletteColor = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setPrimary(Color value) {
    primary = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setSecondary(Color value) {
    secondary = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setGradientBeginEnd(List<FractionalOffset> value) {
    gradientBeginEnd = value;
  }

  @action
  void clearGradient() {
    primary = null;
    secondary = null;
    gradientBeginEnd = null;
  }
}
