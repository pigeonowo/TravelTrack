import 'package:flutter/material.dart';
import 'package:travel_track/models/tracking.dart';
import 'package:travel_track/start_stop_button.dart';
import 'package:travel_track/models/start_stop.dart';
import 'package:travel_track/transport_type_switch.dart';
import 'package:travel_track/models/transport_type.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({super.key});

  @override
  State<ControlPanel> createState() {
    return _ControlPanelState();
  }
}

class _ControlPanelState extends State<ControlPanel> {
  TransportType currentTransportType = TransportType.defaultType();
  StartStop ssState = .stop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransportTypeSwitch(onSelected: onTransportType),
        Center(child: StartStopButton(onPressed: onStartStop)),
      ],
    );
  }

  void onTransportType(TransportType tt) async {
    currentTransportType = tt;
    var i = await Tracking.getInstance();
    if (ssState == .start) {
      i.startTracking(tt);
    }
  }

  void onStartStop(StartStop ss) async {
    var i = await Tracking.getInstance();
    ssState = ss;
    if (ss == .start) {
      i.startTracking(currentTransportType);
    } else {
      i.stopTracking(currentTransportType);
    }
  }
}
