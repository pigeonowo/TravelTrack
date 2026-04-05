import 'package:flutter/material.dart';
import 'package:travel_track/models/start_stop.dart';

class StartStopButton extends StatefulWidget {
  const StartStopButton({super.key, required this.onPressed});

  final void Function(StartStop) onPressed;

  @override
  State<StartStopButton> createState() {
    return _StartStopButtonState();
  }
}

class _StartStopButtonState extends State<StartStopButton> {
  StartStop state = .start;

  @override
  Widget build(BuildContext context) {
    String t;
    if (state == .start) {
      t = "Start";
    } else {
      t = "Stop";
    }
    

    return TextButton(onPressed: onPressed, child: Text(t));
  }

  void onPressed() {
    widget.onPressed(state);
    setState(() {
      if (state == .start) {
        state = .stop;
      } else {
        state = .start;
      }
    });
  }
}
