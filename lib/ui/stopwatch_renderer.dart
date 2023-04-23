import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_markers.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

import 'clock_hand.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsed;
  final double radius;
  const StopwatchRenderer(
      {super.key, required this.elapsed, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(
              seconds: i,
              radius: radius,
            ),
          ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            top: radius,
            left: radius,
            child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
          ),
        // Container(
        //   decoration:
        //       BoxDecoration(border: Border.all(width: 3, color: Colors.orange),
        //       borderRadius: BorderRadius.circular(radius)),
        // ),
        // Transform(
        //   transform: Matrix4.identity()
        //   ..translate(50.0, 0.0, 0.0)
        //   .. rotateZ(pi/4),
        // transform: Matrix4.rotationZ(pi/4),
        //   alignment: Alignment.center,
        //   child: Container(
        //     color: Colors.indigo,
        //   ),
        // ),

        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            handLength: radius,
            handThickness: 2,
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            color: Colors.orange,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
