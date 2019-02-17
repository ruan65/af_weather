import 'package:flutter/material.dart';

class GradientContainerWidget extends StatelessWidget {
  final Widget child;
  final MaterialColor color;

  const GradientContainerWidget(
      {Key key, @required this.color, @required this.child})
      : assert(null != color, null != child),
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: child,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [.6, .8, 1.0],
            colors: [
              color[700],
              color[500],
              color[300],
            ],
          ),
        ),
      );
}
