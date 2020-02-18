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
/// $ flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/l10n.dart lib/l10n/intl_*.arb
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
        desc: 'The name of this application.',
      );

  /// ↓↓↓  FloatingActionButton tooltip text ↓↓↓

  String get tooltipTextSelectImage => Intl.message(
        'Select image',
        name: 'tooltipTextSelectImage',
        desc:
            // ignore: lines_longer_than_80_chars
            'Tooltip text to be displayed on FloatingActionButton of BgImagePicker.',
      );

  String get tooltipTextSelectGradient => Intl.message(
        'Select gradient',
        name: 'tooltipTextSelectGradient',
        desc:
            // ignore: lines_longer_than_80_chars
            'Tooltip text to be displayed on FloatingActionButton of GradientBuilder.',
      );

  String get tooltipTextSetFilter => Intl.message(
        'Set filter',
        name: 'tooltipTextSetFilter',
        desc:
            // ignore: lines_longer_than_80_chars
            'Tooltip text to be displayed on FloatingActionButton of GradientFilter.',
      );

  /// ↓↓↓ Use with WriteMessage widget ↓↓↓

  String get messageDefault => Intl.message(
        'Enter something...',
        name: 'messageDefault',
        desc: 'Default value when putting a message on the image.',
      );

  String get hintText => Intl.message(
        'Message',
        name: 'hintText',
        desc:
            // ignore: lines_longer_than_80_chars
            'TextField hint text for message inputTextField hint text for message input.',
      );
}
