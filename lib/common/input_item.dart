import 'package:flutter/material.dart';

class InputItem extends StatelessWidget {
  const InputItem({
    Key key,
    @required this.icon,
    @required this.input,
  }) : super(key: key);

  final Icon icon;
  final Widget input;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: icon,
        ),
        Expanded(
          flex: 4,
          child: Container(child: input),
        ),
      ],
    );
  }
}