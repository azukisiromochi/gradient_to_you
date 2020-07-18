import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/animated_focus_light.dart';
import 'package:tutorial_coach_mark/target_position.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialUtils {
  static TargetFocus makeTargetFocus({
    GlobalKey key,
    TargetPosition targetPosition,
    String title,
    String explanation,
    ShapeLightFocus shape,
    AlignContent align,
  }) {
    return TargetFocus(
      keyTarget: key,
      targetPosition: targetPosition,
      contents: [
        ContentTarget(
          align: align ?? AlignContent.bottom,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    explanation,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
      shape: shape ?? ShapeLightFocus.RRect,
    );
  }

  static void showTutorial(BuildContext context,
      {List<TargetFocus> targets, Color colorShadow, Function() finish}) {
    makeTutorial(
      context,
      targets: targets,
      colorShadow: colorShadow,
      finish: finish,
    ).show();
  }

  static TutorialCoachMark makeTutorial(BuildContext context,
      {List<TargetFocus> targets, Color colorShadow, Function() finish}) {
    // ignore: avoid_single_cascade_in_expression_statements
    return TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: colorShadow ?? Colors.black,
      alignSkip: Alignment.topLeft,
      paddingFocus: 10,
      opacityShadow: 0.8,
      finish: finish,
      clickTarget: print,
//      clickSkip: () {
//        print('skip');
//      },
    );
  }
}
