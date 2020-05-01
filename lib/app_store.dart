import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:gradient_to_you/utils/app_theme_utils.dart';

part 'app_store.g.dart';

/// ✨ Run the following command inside your project folder.
///    This generates the code in app_store.g.dart,
///    which we have already included as part file.
///
/// $ flutter packages pub run build_runner build
///

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
  int bgImageWidth;

  @observable
  int bgImageHeight;

  @observable
  double opacity = 0.6;

  @observable
  String message;

  @observable
  Offset offset;

  @observable
  double fontSize;

  @observable
  ByteData pngImage;

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
          ).createShader(
            Rect.fromLTWH(
              0,
              0,
              bgImageWidth.toDouble(),
              bgImageHeight.toDouble(),
            ),
          );
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
  void setBgImage(File value, Size deviceSize) {
    bgImage = value;

    if (value != null) {
      decodeImageFromList(value.readAsBytesSync()).then((decodedImage) {
        var _width = decodedImage.width;
        var _height = decodedImage.height;
        if (deviceSize.width < _width) {
          _width = deviceSize.width.toInt();
          _height = _width * decodedImage.height ~/ decodedImage.width;
        }

        final _limitHeight = (deviceSize.height / 2) - 50;
        if (_limitHeight < _height) {
          _height = _limitHeight.toInt();
          _width = _height * decodedImage.width ~/ decodedImage.height;
        }
        bgImageWidth = _width;
        bgImageHeight = _height;
      });
    }
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

  // ignore: use_setters_to_change_properties
  @action
  void setMessage(String value) {
    message = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setOffset(Offset value) {
    offset = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setFontSize(double value) {
    fontSize = value;
  }

  // ignore: use_setters_to_change_properties
  @action
  void setPngImage(ByteData value) {
    pngImage = value;
  }
}
