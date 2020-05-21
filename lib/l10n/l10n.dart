import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'l10n_delegate.dart';
import 'messages_all.dart';

///
/// ✨ Creating arb file (JSON file of wording resources) ✨
/// $ flutter packages pub run intl_translation:extract_to_arb --locale=messages --output-dir=lib/l10n lib/l10n/l10n.dart
///
/// ✨ Generate classes required for multilingual support from arb file ✨
/// $ flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/l10n.dart lib/l10n/intl_en.arb lib/l10n/intl_ja.arb lib/l10n/intl_messages.arb
///

class L10n {
  static Future<L10n> load(Locale locale) async {
    final name = locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    await initializeMessages(localeName);
    Intl.defaultLocale = localeName;
    return L10n();
  }

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = L10nDelegate();

  /// ↓↓↓ App All ↓↓↓

  String get appName => Intl.message(
        'Gradient to you',
        name: 'appName',
      );

  /// ↓↓↓  FloatingActionButton tooltip text ↓↓↓

  String get tooltipTextSelectImage => Intl.message(
        'Select image',
        name: 'tooltipTextSelectImage',
      );

  String get tooltipTextSelectGradient => Intl.message(
        'Select gradient',
        name: 'tooltipTextSelectGradient',
      );

  String get tooltipTextSetFilter => Intl.message(
        'Set filter',
        name: 'tooltipTextSetFilter',
      );

  /// ↓↓↓ Use with SideMenu ↓↓↓

  String get sideMenuRate => Intl.message(
        'Rate the App',
        name: 'sideMenuRate',
      );

  String get sideMenuShare => Intl.message(
        'Share the App',
        name: 'sideMenuShare',
      );

  String get sideMenuPreferences => Intl.message(
        'Preferences',
        name: 'sideMenuPreferences',
      );

  String get sideMenuFeedback => Intl.message(
        'Feedback',
        name: 'sideMenuFeedback',
      );

  String get sideMenuPrivacyPolicy => Intl.message(
        'Privacy Policy',
        name: 'sideMenuPrivacyPolicy',
      );

  String get sideMenuLicenses => Intl.message(
        'Third Party Notices',
        name: 'sideMenuLicenses',
      );

  /// ↓↓↓ Use with WriteMessage page ↓↓↓

  String get messageDefault => Intl.message(
        'Enter something...',
        name: 'messageDefault',
      );

  String get hintText => Intl.message(
        'Message',
        name: 'hintText',
      );

  String get bottomBarTitleMessage => Intl.message(
        'Message',
        name: 'bottomBarTitleMessage',
      );

  String get bottomBarTitleSize => Intl.message(
        'Size',
        name: 'bottomBarTitleSize',
      );

  String get bottomBarTitleFormat => Intl.message(
        'Format',
        name: 'bottomBarTitleFormat',
      );

  String get fontFamilyDropdownHintText => Intl.message(
        'Please select font-family',
        name: 'fontFamilyDropdownHintText',
      );

  String get fontColorPickerTitle => Intl.message(
        'Pick a color',
        name: 'fontColorPickerTitle',
      );

  String get fontColorPickerButton => Intl.message(
        'Got it',
        name: 'fontColorPickerButton',
      );

  String get fontColorPicker => Intl.message(
        'Change font color',
        name: 'fontColorPicker',
      );

  String get googleFontsSawarabiGothic => Intl.message(
        'Sawarabi Gothic',
        name: 'googleFontsSawarabiGothic',
      );

  String get googleFontsNotoSerifJP => Intl.message(
        'Noto Serif JP',
        name: 'googleFontsNotoSerifJP',
      );

  String get googleFontsKosugiMaru => Intl.message(
        'Kosugi Maru',
        name: 'googleFontsKosugiMaru',
      );

  /// ↓↓↓ Use with SaveOrShare page ↓↓↓

  String get toastSave => Intl.message(
        'Image saved !',
        name: 'toastSave',
      );

  String get buttonSave => Intl.message(
        'Save device',
        name: 'buttonSave',
      );

  String get buttonShare => Intl.message(
        'Share',
        name: 'buttonShare',
      );
}
