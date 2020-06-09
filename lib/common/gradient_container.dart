import 'package:flutter/material.dart';
import 'package:gradient_to_you/app_store.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    Key key,
    @required this.store,
    this.child,
    this.gradientBegin,
    this.gradientEnd,
    this.colors,
  }) : super(key: key);

  final AppStore store;
  final Widget child;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: gradientBegin ?? FractionalOffset.topLeft,
          end: gradientEnd ?? FractionalOffset.bottomRight,
          colors: colors ?? store.gradientColors,
          stops: const [
            0.0,
            1.0,
          ],
        ),
      ),
      child: child,
    );
  }
}
