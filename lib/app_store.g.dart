// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  Computed<TextStyle> _$textStyleComputed;

  @override
  TextStyle get textStyle =>
      (_$textStyleComputed ??= Computed<TextStyle>(() => super.textStyle))
          .value;
  Computed<Color> _$baseColorComputed;

  @override
  Color get baseColor =>
      (_$baseColorComputed ??= Computed<Color>(() => super.baseColor)).value;
  Computed<Color> _$baseTextColorComputed;

  @override
  Color get baseTextColor =>
      (_$baseTextColorComputed ??= Computed<Color>(() => super.baseTextColor))
          .value;
  Computed<Widget> _$gradientImageComputed;

  @override
  Widget get gradientImage =>
      (_$gradientImageComputed ??= Computed<Widget>(() => super.gradientImage))
          .value;

  final _$themeNoAtom = Atom(name: '_AppStore.themeNo');

  @override
  int get themeNo {
    _$themeNoAtom.context.enforceReadPolicy(_$themeNoAtom);
    _$themeNoAtom.reportObserved();
    return super.themeNo;
  }

  @override
  set themeNo(int value) {
    _$themeNoAtom.context.conditionallyRunInAction(() {
      super.themeNo = value;
      _$themeNoAtom.reportChanged();
    }, _$themeNoAtom, name: '${_$themeNoAtom.name}_set');
  }

  final _$gradientColorsAtom = Atom(name: '_AppStore.gradientColors');

  @override
  List<Color> get gradientColors {
    _$gradientColorsAtom.context.enforceReadPolicy(_$gradientColorsAtom);
    _$gradientColorsAtom.reportObserved();
    return super.gradientColors;
  }

  @override
  set gradientColors(List<Color> value) {
    _$gradientColorsAtom.context.conditionallyRunInAction(() {
      super.gradientColors = value;
      _$gradientColorsAtom.reportChanged();
    }, _$gradientColorsAtom, name: '${_$gradientColorsAtom.name}_set');
  }

  final _$paletteColorAtom = Atom(name: '_AppStore.paletteColor');

  @override
  HSLColor get paletteColor {
    _$paletteColorAtom.context.enforceReadPolicy(_$paletteColorAtom);
    _$paletteColorAtom.reportObserved();
    return super.paletteColor;
  }

  @override
  set paletteColor(HSLColor value) {
    _$paletteColorAtom.context.conditionallyRunInAction(() {
      super.paletteColor = value;
      _$paletteColorAtom.reportChanged();
    }, _$paletteColorAtom, name: '${_$paletteColorAtom.name}_set');
  }

  final _$primaryAtom = Atom(name: '_AppStore.primary');

  @override
  Color get primary {
    _$primaryAtom.context.enforceReadPolicy(_$primaryAtom);
    _$primaryAtom.reportObserved();
    return super.primary;
  }

  @override
  set primary(Color value) {
    _$primaryAtom.context.conditionallyRunInAction(() {
      super.primary = value;
      _$primaryAtom.reportChanged();
    }, _$primaryAtom, name: '${_$primaryAtom.name}_set');
  }

  final _$secondaryAtom = Atom(name: '_AppStore.secondary');

  @override
  Color get secondary {
    _$secondaryAtom.context.enforceReadPolicy(_$secondaryAtom);
    _$secondaryAtom.reportObserved();
    return super.secondary;
  }

  @override
  set secondary(Color value) {
    _$secondaryAtom.context.conditionallyRunInAction(() {
      super.secondary = value;
      _$secondaryAtom.reportChanged();
    }, _$secondaryAtom, name: '${_$secondaryAtom.name}_set');
  }

  final _$gradientBeginEndAtom = Atom(name: '_AppStore.gradientBeginEnd');

  @override
  List<FractionalOffset> get gradientBeginEnd {
    _$gradientBeginEndAtom.context.enforceReadPolicy(_$gradientBeginEndAtom);
    _$gradientBeginEndAtom.reportObserved();
    return super.gradientBeginEnd;
  }

  @override
  set gradientBeginEnd(List<FractionalOffset> value) {
    _$gradientBeginEndAtom.context.conditionallyRunInAction(() {
      super.gradientBeginEnd = value;
      _$gradientBeginEndAtom.reportChanged();
    }, _$gradientBeginEndAtom, name: '${_$gradientBeginEndAtom.name}_set');
  }

  final _$bgImageAtom = Atom(name: '_AppStore.bgImage');

  @override
  File get bgImage {
    _$bgImageAtom.context.enforceReadPolicy(_$bgImageAtom);
    _$bgImageAtom.reportObserved();
    return super.bgImage;
  }

  @override
  set bgImage(File value) {
    _$bgImageAtom.context.conditionallyRunInAction(() {
      super.bgImage = value;
      _$bgImageAtom.reportChanged();
    }, _$bgImageAtom, name: '${_$bgImageAtom.name}_set');
  }

  final _$bgImageWidthAtom = Atom(name: '_AppStore.bgImageWidth');

  @override
  int get bgImageWidth {
    _$bgImageWidthAtom.context.enforceReadPolicy(_$bgImageWidthAtom);
    _$bgImageWidthAtom.reportObserved();
    return super.bgImageWidth;
  }

  @override
  set bgImageWidth(int value) {
    _$bgImageWidthAtom.context.conditionallyRunInAction(() {
      super.bgImageWidth = value;
      _$bgImageWidthAtom.reportChanged();
    }, _$bgImageWidthAtom, name: '${_$bgImageWidthAtom.name}_set');
  }

  final _$bgImageHeightAtom = Atom(name: '_AppStore.bgImageHeight');

  @override
  int get bgImageHeight {
    _$bgImageHeightAtom.context.enforceReadPolicy(_$bgImageHeightAtom);
    _$bgImageHeightAtom.reportObserved();
    return super.bgImageHeight;
  }

  @override
  set bgImageHeight(int value) {
    _$bgImageHeightAtom.context.conditionallyRunInAction(() {
      super.bgImageHeight = value;
      _$bgImageHeightAtom.reportChanged();
    }, _$bgImageHeightAtom, name: '${_$bgImageHeightAtom.name}_set');
  }

  final _$opacityAtom = Atom(name: '_AppStore.opacity');

  @override
  double get opacity {
    _$opacityAtom.context.enforceReadPolicy(_$opacityAtom);
    _$opacityAtom.reportObserved();
    return super.opacity;
  }

  @override
  set opacity(double value) {
    _$opacityAtom.context.conditionallyRunInAction(() {
      super.opacity = value;
      _$opacityAtom.reportChanged();
    }, _$opacityAtom, name: '${_$opacityAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_AppStore.message');

  @override
  String get message {
    _$messageAtom.context.enforceReadPolicy(_$messageAtom);
    _$messageAtom.reportObserved();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.context.conditionallyRunInAction(() {
      super.message = value;
      _$messageAtom.reportChanged();
    }, _$messageAtom, name: '${_$messageAtom.name}_set');
  }

  final _$offsetAtom = Atom(name: '_AppStore.offset');

  @override
  Offset get offset {
    _$offsetAtom.context.enforceReadPolicy(_$offsetAtom);
    _$offsetAtom.reportObserved();
    return super.offset;
  }

  @override
  set offset(Offset value) {
    _$offsetAtom.context.conditionallyRunInAction(() {
      super.offset = value;
      _$offsetAtom.reportChanged();
    }, _$offsetAtom, name: '${_$offsetAtom.name}_set');
  }

  final _$fontSizeAtom = Atom(name: '_AppStore.fontSize');

  @override
  double get fontSize {
    _$fontSizeAtom.context.enforceReadPolicy(_$fontSizeAtom);
    _$fontSizeAtom.reportObserved();
    return super.fontSize;
  }

  @override
  set fontSize(double value) {
    _$fontSizeAtom.context.conditionallyRunInAction(() {
      super.fontSize = value;
      _$fontSizeAtom.reportChanged();
    }, _$fontSizeAtom, name: '${_$fontSizeAtom.name}_set');
  }

  final _$rotatedDegreesAtom = Atom(name: '_AppStore.rotatedDegrees');

  @override
  double get rotatedDegrees {
    _$rotatedDegreesAtom.context.enforceReadPolicy(_$rotatedDegreesAtom);
    _$rotatedDegreesAtom.reportObserved();
    return super.rotatedDegrees;
  }

  @override
  set rotatedDegrees(double value) {
    _$rotatedDegreesAtom.context.conditionallyRunInAction(() {
      super.rotatedDegrees = value;
      _$rotatedDegreesAtom.reportChanged();
    }, _$rotatedDegreesAtom, name: '${_$rotatedDegreesAtom.name}_set');
  }

  final _$fontColorAtom = Atom(name: '_AppStore.fontColor');

  @override
  Color get fontColor {
    _$fontColorAtom.context.enforceReadPolicy(_$fontColorAtom);
    _$fontColorAtom.reportObserved();
    return super.fontColor;
  }

  @override
  set fontColor(Color value) {
    _$fontColorAtom.context.conditionallyRunInAction(() {
      super.fontColor = value;
      _$fontColorAtom.reportChanged();
    }, _$fontColorAtom, name: '${_$fontColorAtom.name}_set');
  }

  final _$fontFamilyAtom = Atom(name: '_AppStore.fontFamily');

  @override
  String get fontFamily {
    _$fontFamilyAtom.context.enforceReadPolicy(_$fontFamilyAtom);
    _$fontFamilyAtom.reportObserved();
    return super.fontFamily;
  }

  @override
  set fontFamily(String value) {
    _$fontFamilyAtom.context.conditionallyRunInAction(() {
      super.fontFamily = value;
      _$fontFamilyAtom.reportChanged();
    }, _$fontFamilyAtom, name: '${_$fontFamilyAtom.name}_set');
  }

  final _$pngImageAtom = Atom(name: '_AppStore.pngImage');

  @override
  ByteData get pngImage {
    _$pngImageAtom.context.enforceReadPolicy(_$pngImageAtom);
    _$pngImageAtom.reportObserved();
    return super.pngImage;
  }

  @override
  set pngImage(ByteData value) {
    _$pngImageAtom.context.conditionallyRunInAction(() {
      super.pngImage = value;
      _$pngImageAtom.reportChanged();
    }, _$pngImageAtom, name: '${_$pngImageAtom.name}_set');
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void setPaletteColor(HSLColor value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setPaletteColor(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrimary(Color value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setPrimary(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecondary(Color value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setSecondary(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGradientBeginEnd(List<FractionalOffset> value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setGradientBeginEnd(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBgImage(File value, Size deviceSize) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setBgImage(value, deviceSize);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOpacity(double value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setOpacity(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearGradient() {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.clearGradient();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setMessage(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOffset(Offset value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setOffset(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFontSize(double value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setFontSize(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRotatedDegrees(double value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setRotatedDegrees(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFontColor(Color value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setFontColor(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFontFamily(String value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setFontFamily(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPngImage(ByteData value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setPngImage(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
