// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
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

  final _$baseColorAtom = Atom(name: '_AppStore.baseColor');

  @override
  Color get baseColor {
    _$baseColorAtom.context.enforceReadPolicy(_$baseColorAtom);
    _$baseColorAtom.reportObserved();
    return super.baseColor;
  }

  @override
  set baseColor(Color value) {
    _$baseColorAtom.context.conditionallyRunInAction(() {
      super.baseColor = value;
      _$baseColorAtom.reportChanged();
    }, _$baseColorAtom, name: '${_$baseColorAtom.name}_set');
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void setBaseColor(Color value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setBaseColor(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
