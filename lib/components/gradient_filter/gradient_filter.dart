import 'package:gradient_to_you/common/color_app_bar.dart';

import '../../app_store.dart';
import '../importer.dart';

class GradientFilter extends StatefulWidget {
  const GradientFilter({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  _GradientFilterState createState() => _GradientFilterState();
}

class _GradientFilterState extends State<GradientFilter> {
  TutorialCoachMark _tutorial;
  final List<TargetFocus> _targets = [];
  final GlobalKey _tutorialKey = GlobalKey();
  final Preferences _prefs = Preferences();

  @override
  void initState() {
    _showTutorial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    final opacity = widget.store.opacity;
    final themeColor = widget.store.baseTextColor;

    return Scaffold(
      appBar: ColorAppBar(store: widget.store),
      body: WillPopScope(
        onWillPop: () async {
          _tutorial?.hide();
          Navigator.of(context).pop();
          return true;
        },
        child: Center(
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 4,
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 400,
                ),
                child: Center(child: widget.store.gradientImage),
              ),
              Slider(
                key: _tutorialKey,
                label: '${opacity.toStringAsFixed(2)}',
                min: 0.1,
                max: 0.9,
                value: opacity,
                activeColor: widget.store.baseColor,
                inactiveColor: themeColor,
                divisions: 80,
                onChanged: _changeSlider,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(Screen.writeMessage.url),
        tooltip: l10n.tooltipTextSetFilter,
        backgroundColor: widget.store.baseColor,
        child: Icon(Icons.check, color: themeColor),
      ),
    );
  }

  void _changeSlider(double newValue) => setState(() {
        widget.store.setOpacity(newValue);
      });

  void _showTutorial() {
    if (!_prefs.isFinishedTutorial(Screen.gradientFilter)) {
      _initTargets();
      WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    }
  }

  void _initTargets() {
    _targets.add(TutorialUtils.makeTargetFocus(
      key: _tutorialKey,
      title: 'グラデーションの調整',
      explanation:
          // ignore: lines_longer_than_80_chars
          'スライダーを左右に移動させると、グラデーションの濃さを調整できるよ！',
      align: AlignContent.top,
    ));
  }

  void _startTutorial() {
    _tutorial = TutorialUtils.makeTutorial(
      context,
      targets: _targets,
      colorShadow: ColorUtils.hslFromHue030.toColor(),
      finish: () => _prefs.finishTutorial(Screen.gradientFilter),
    )..show();
  }

  void _afterLayout(dynamic _) {
    Future.delayed(const Duration(milliseconds: 200), _startTutorial);
  }
}
