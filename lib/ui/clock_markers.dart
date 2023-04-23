import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  final int seconds;
  final double radius;

  const ClockSecondsTickMarker(
      {super.key, required this.seconds, required this.radius});

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 2.0;
    const height = 12.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  final int value;
  final int maxValue;
  final double radius;

  const ClockTextMarker(
      {super.key,
      required this.value,
      required this.maxValue,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 40.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
      ..translate(-width / 2, -height / 2, 0.0)
      ..rotateZ(pi + 2 * pi *(value / maxValue))
      ..translate(0.0, radius - 35, 0.0)
      ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
