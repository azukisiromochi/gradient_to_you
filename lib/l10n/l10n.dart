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

  /// ↓↓↓ Use with Tutorial ↓↓↓

  String get tutorialTitleForColorPalette => Intl.message(
        "Let's start!",
        name: 'tutorialTitleForColorPalette',
      );

  String get tutorialExplanationForColorPalette => Intl.message(
        // ignore: lines_longer_than_80_chars
        '"Gradient to you" is an application that sends a message by colorizing photos and illustrations.\nFirst, let\'s choose the main color!',
        name: 'tutorialExplanationForColorPalette',
      );

  String get tutorialTitleForGradientBuilder => Intl.message(
        "Let's decide the gradient!",
        name: 'tutorialTitleForGradientBuilder',
      );

  String get tutorialExplanationForGradientBuilder => Intl.message(
        // ignore: lines_longer_than_80_chars
        'Tap the screen to create a gradient using the main colors.\nTap until you find the gradient you like! Tap!! Tap!!!',
        name: 'tutorialExplanationForGradientBuilder',
      );

  String get tutorialTitle1ForImagePicker => Intl.message(
        "Let's decide the image!",
        name: 'tutorialTitle1ForImagePicker',
      );

  String get tutorialExplanation1ForImagePicker => Intl.message(
        // ignore: lines_longer_than_80_chars
        'A list of images stored on your device is displayed.\nSelect your favorite image!',
        name: 'tutorialExplanation1ForImagePicker',
      );

  String get tutorialTitle2aForImagePicker => Intl.message(
        'When changing the image.',
        name: 'tutorialTitle2aForImagePicker',
      );

  String get tutorialExplanation2aForImagePicker => Intl.message(
        'You can select the image again from the button on the top right!',
        name: 'tutorialExplanation2aForImagePicker',
      );

  String get tutorialTitle2bForImagePicker => Intl.message(
        'Determine the image!',
        name: 'tutorialTitle2bForImagePicker',
      );

  String get tutorialExplanation2bForImagePicker => Intl.message(
        "Let's overlay a gradation when the image is decided!",
        name: 'tutorialExplanation2bForImagePicker',
      );

  String get tutorialTitleForGradientFilter => Intl.message(
        'Adjust the gradient.',
        name: 'tutorialTitleForGradientFilter',
      );

  String get tutorialExplanationForGradientFilter => Intl.message(
        'You can adjust the gradation by moving the slider left or right!',
        name: 'tutorialExplanationForGradientFilter',
      );

  String get tutorialTitleForWriteMessage => Intl.message(
    "Let's write a message!",
    name: 'tutorialTitleForWriteMessage',
  );

  String get tutorialExplanation1ForWriteMessage => Intl.message(
    'You can enter a message.',
    name: 'tutorialExplanation1ForWriteMessage',
  );

  String get tutorialExplanation2ForWriteMessage => Intl.message(
    'You can change the font size and the inclination of the characters.',
    name: 'tutorialExplanation2ForWriteMessage',
  );

  String get tutorialExplanation3ForWriteMessage => Intl.message(
    'You can change the font family and font color.',
    name: 'tutorialExplanation3ForWriteMessage',
  );

  String get tutorialTitle1ForSaveOrShare => Intl.message(
    'Congratulations!',
    name: 'tutorialTitle1ForSaveOrShare',
  );

  String get tutorialExplanation1ForSaveOrShare => Intl.message(
    'Click this button if you save to your device.',
    name: 'tutorialExplanation1ForSaveOrShare',
  );

  String get tutorialTitle2ForSaveOrShare => Intl.message(
    'Congratulations!',
    name: 'tutorialTitle2ForSaveOrShare',
  );

  String get tutorialExplanation2ForSaveOrShare => Intl.message(
    'Click this button if you want to share.',
    name: 'tutorialExplanation2ForSaveOrShare',
  );
}
