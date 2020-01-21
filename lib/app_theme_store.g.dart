// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppThemeStore on _AppThemeStore, Store {
  final _$themeNoAtom = Atom(name: '_AppThemeStore.themeNo');

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

  final _$splashImageAtom = Atom(name: '_AppThemeStore.splashImage');

  @override
  AssetImage get splashImage {
    _$splashImageAtom.context.enforceReadPolicy(_$splashImageAtom);
    _$splashImageAtom.reportObserved();
    return super.splashImage;
  }

  @override
  set splashImage(AssetImage value) {
    _$splashImageAtom.context.conditionallyRunInAction(() {
      super.splashImage = value;
      _$splashImageAtom.reportChanged();
    }, _$splashImageAtom, name: '${_$splashImageAtom.name}_set');
  }

  final _$gradientColorsAtom = Atom(name: '_AppThemeStore.gradientColors');

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

  final _$logoStyleAtom = Atom(name: '_AppThemeStore.logoStyle');

  @override
  TextStyle get logoStyle {
    _$logoStyleAtom.context.enforceReadPolicy(_$logoStyleAtom);
    _$logoStyleAtom.reportObserved();
    return super.logoStyle;
  }

  @override
  set logoStyle(TextStyle value) {
    _$logoStyleAtom.context.conditionallyRunInAction(() {
      super.logoStyle = value;
      _$logoStyleAtom.reportChanged();
    }, _$logoStyleAtom, name: '${_$logoStyleAtom.name}_set');
  }

  final _$appBarStyleAtom = Atom(name: '_AppThemeStore.appBarStyle');

  @override
  TextStyle get appBarStyle {
    _$appBarStyleAtom.context.enforceReadPolicy(_$appBarStyleAtom);
    _$appBarStyleAtom.reportObserved();
    return super.appBarStyle;
  }

  @override
  set appBarStyle(TextStyle value) {
    _$appBarStyleAtom.context.conditionallyRunInAction(() {
      super.appBarStyle = value;
      _$appBarStyleAtom.reportChanged();
    }, _$appBarStyleAtom, name: '${_$appBarStyleAtom.name}_set');
  }

  final _$getAsyncAction = AsyncAction('get');

  @override
  Future<int> get() {
    return _$getAsyncAction.run(() => super.get());
  }
}
