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
}
