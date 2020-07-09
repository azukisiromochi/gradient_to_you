import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradient_to_you/utils/screen.dart';

class Preferences {
  factory Preferences() => _cache;

  Preferences._internal() {
    init();
  }

  static final Preferences _cache = Preferences._internal();

  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static final Map<Screen, bool> _tutorials = {
    Screen.colorPalette: false,
    Screen.gradientBuilder: false,
    Screen.imagePicker: false,
    Screen.gradientFilter: false,
    Screen.writeMessage: false,
    Screen.saveOrShare: false,
  };

  bool isFinishedTutorial(Screen screen) => _tutorials[screen];

  Future<void> finishTutorial(Screen screen) async {
    await _prefs.then((SharedPreferences prefs) {
      prefs.setBool(screen.name, true);
    });
    _tutorials[screen] = true;
  }

  Future<void> init() async {
    for (final screen in Screen.values) {
      await _prefs.then((SharedPreferences prefs) {
        _tutorials[screen] = prefs.getBool(screen.name) ?? false;
      });
    }
  }
}
