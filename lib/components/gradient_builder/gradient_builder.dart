import 'package:flutter/material.dart';
import 'package:gradient_to_you/common/color_app_bar.dart';
import 'package:gradient_to_you/common/gradient_container.dart';
import 'package:gradient_to_you/l10n/l10n.dart';
import 'package:gradient_to_you/utils/color_utils.dart';
import 'package:gradient_to_you/utils/tutorial_utils.dart';
import 'package:tutorial_coach_mark/animated_focus_light.dart';
import 'package:tutorial_coach_mark/content_target.dart';
import 'package:tutorial_coach_mark/target_focus.dart';
import 'package:tutorial_coach_mark/target_position.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../app_store.dart';

class GradientBuilder extends StatelessWidget {
  const GradientBuilder({Key key, @required this.store}) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    final themeColor = store.baseTextColor;

    return Scaffold(
      appBar: ColorAppBar(store: store),
      body: GradientBody(store: store),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/image_picker'),
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
  TutorialCoachMark tutorial;
  List<TargetFocus> targets = [];
  GlobalKey tutorialKey = GlobalKey();

  @override
  void initState() {
    initTargets();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
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
      onWillPop: () {
        tutorial.hide();
        Navigator.of(context).pop();
      },
      child: GradientContainer(
        key: tutorialKey,
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

  void initTargets() {
    final target = TargetPosition(const Size(100, 100), const Offset(150, 400));
    targets.add(TutorialUtils.makeTargetFocus(
      targetPosition: target,
      title: 'グラデーションを決めよう！',
      explanation:
          // ignore: lines_longer_than_80_chars
          '画面をタップするとメインのカラーを利用したグラデーションが作成されます。\nおきにいりのグラデーションが見つかるまで、タップ！タップ！！タップ！！！',
      align: AlignContent.top,
      shape: ShapeLightFocus.Circle,
    ));
  }

  void _showTutorial() {
    tutorial = TutorialUtils.makeTutorial(
      context,
      targets: targets,
      colorShadow: ColorUtils.hslFromHue030.toColor(),
    );
    tutorial.show();
  }

  void _afterLayout(dynamic _) {
    Future.delayed(const Duration(milliseconds: 200), _showTutorial);
  }
}
