import 'package:flutter/material.dart';
import 'package:travel_track/start_stop_button.dart';
import 'package:travel_track/models/start_stop.dart';
import 'package:travel_track/transport_type_switch.dart';
import 'package:travel_track/models/transport_type.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransportTypeSwitch(onSelected: onTransportType),
        Center(
          child: StartStopButton(onPressed: onStartStop),
        ),
      ],
    );
  }

  void onTransportType(TransportType tt) {
    print("Selected: $tt");
  }

  void onStartStop(StartStop ss) {
    if (ss == .start) {
      print("Started...");
    } else {
      print("Stopped...");
    }
  }
}