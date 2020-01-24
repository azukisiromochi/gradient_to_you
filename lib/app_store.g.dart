// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  Computed<Color> _$baseColorComputed;

  @override
  Color get baseColor =>
      (_$baseColorComputed ??= Computed<Color>(() => super.baseColor)).value;

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
  void clearGradient() {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.clearGradient();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
