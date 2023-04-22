import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text_basic.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  late DateTime _initialTime;
  Duration _elapsed = Duration.zero;
  late final Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialTime = DateTime.now();
   _timer = Timer.periodic(Duration(microseconds: 50), (_) {
      final now = DateTime.now();
      setState(() {
        _elapsed = now.difference(_initialTime);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeText(
      elapsed: _elapsed,
    );
  }
}
