import 'dart:io';

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

  @observable
  File bgImage;

  @observable
  double opacity = 0.6;

  @computed
  Color get baseColor => paletteColor?.toColor() ?? Colors.black;

  @computed
  Color get baseTextColor =>
      paletteColor?.withLightness(0.2)?.toColor() ?? Colors.white;

  @computed
  Widget get gradientImage => ShaderMask(
    child: Image(
      image: FileImage(bgImage),
    ),
    shaderCallback: (Rect bounds) {
      return LinearGradient(
        begin: gradientBeginEnd.first,
        end: gradientBeginEnd.last,
        colors: [
          primary.withOpacity(opacity),
          secondary.withOpacity(opacity),
        ],
        stops: const [
          0.0,
          1.0,
        ],
      ).createShader(bounds);
    },
    blendMode: BlendMode.srcATop,
  );

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

  // ignore: use_setters_to_change_properties
  @action
  void setBgImage(File value) {
    bgImage = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setOpacity(double value) {
    opacity = value;
  }

  @action
  void clearGradient() {
    primary = null;
    secondary = null;
    gradientBeginEnd = null;
  }
}
