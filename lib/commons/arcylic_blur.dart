import 'dart:ui';

import 'package:flutter/material.dart';
class Blurred extends StatelessWidget {
  const Blurred(
      this.widget, {
        Key? key,
        required this.child,
        this.blurValue = 5,
        this.alignment = Alignment.center,
      }) : super(key: key);

  final Widget widget;
  final Widget child;
  final double blurValue;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        alignment: alignment,
        children: <Widget>[
          widget,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
              child: Container(),
            ),
          ),
          if (child != null) child,
        ],
      ),
    );
  }
}

class AcrylicBlur extends StatelessWidget {
  final Widget child;
  final double blurValue;
  final Color color;
  final int alpha;
  final double height;
  final AlignmentGeometry alignment;

  const AcrylicBlur({
    Key? key,
    required this.child,
    this.blurValue = 5,
    this.color = Colors.black,
    this.alpha = 50,
    this.height = 100,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Blurred(
      Container(
        height: height,
        color: color.withAlpha(alpha),
      ),
      blurValue: blurValue,
      child: child,
      alignment: alignment,
    );
  }
}