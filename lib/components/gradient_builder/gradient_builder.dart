import 'package:gradient_to_you/common/color_app_bar.dart';
import 'package:gradient_to_you/common/gradient_container.dart';
import 'package:tutorial_coach_mark/animated_focus_light.dart';
import 'package:tutorial_coach_mark/content_target.dart';
import 'package:tutorial_coach_mark/target_focus.dart';
import 'package:tutorial_coach_mark/target_position.dart';

import '../../app_store.dart';
import '../importer.dart';

class GradientBuilder extends StatelessWidget {
  const GradientBuilder({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final l10n = store.l10n;

    final themeColor = store.baseTextColor;

    return Scaffold(
      appBar: ColorAppBar(store: store),
      body: GradientBody(store: store),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(Screen.imagePicker.url),
        tooltip: l10n.tooltipTextSelectGradient,
        backgroundColor: store.baseColor,
        child: Icon(Icons.check, color: themeColor),
      ),
    );
  }
}

class GradientBody extends StatefulWidget {
  const GradientBody({Key key, this.store}) : super(key: key);

  final AppStore store;

  @override
  _GradientBodyState createState() => _GradientBodyState();
}

class _GradientBodyState extends State<GradientBody> {
  TutorialCoachMark _tutorial;
  final List<TargetFocus> _targets = [];
  final Preferences _prefs = Preferences();

  @override
  void initState() {
    _showTutorial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.store.primary == null) {
      widget.store.setPrimary(
          ColorUtils.randomHsl(HSLColor.fromColor(widget.store.baseColor).hue)
              .toColor());
      widget.store.setSecondary(ColorUtils.randomHsl().toColor());
      widget.store.setGradientBeginEnd(ColorUtils.randomGradientBeginEnd());
    }

    return WillPopScope(
      onWillPop: () async {
        _tutorial?.hide();
        Navigator.of(context).pop();
        return true;
      },
      child: GradientContainer(
        store: widget.store,
        gradientBegin: widget.store.gradientBeginEnd.first,
        gradientEnd: widget.store.gradientBeginEnd.last,
        colors: [
          widget.store.primary,
          widget.store.secondary,
        ],
        child: InkWell(
          onTap: () => setState(() {
            widget.store.clearGradient();
          }),
        ),
      ),
    );
  }

  void _showTutorial() {
    if (!_prefs.isFinishedTutorial(Screen.gradientBuilder)) {
      _initTargets();
      WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    }
  }

  void _initTargets() {
    final target = TargetPosition(const Size(100, 100), const Offset(150, 400));
    _targets.add(TutorialUtils.makeTargetFocus(
      targetPosition: target,
      title: widget.store.l10n.tutorialTitleForGradientBuilder,
      explanation: widget.store.l10n.tutorialExplanationForGradientBuilder,
      align: AlignContent.top,
      shape: ShapeLightFocus.Circle,
    ));
  }

  void _startTutorial() {
    _tutorial = TutorialUtils.makeTutorial(
      context,
      targets: _targets,
      colorShadow: ColorUtils.hslFromHue150.toColor(),
      finish: () => _prefs.finishTutorial(Screen.gradientBuilder),
    )..show();
  }

  void _afterLayout(dynamic _) {
    Future.delayed(const Duration(milliseconds: 200), _startTutorial);
  }
}
