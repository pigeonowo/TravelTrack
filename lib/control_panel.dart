import 'dart:async';

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
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        
      });
    });
    _initState();
  }
  void _initState() async {
    tracking = await .getInstance();
  }

  Tracking? tracking;

  @override
  Widget build(BuildContext context) {
    int minutes = (tracking != null ? tracking!.timeTracked / 60 : 0).truncate();
    int seconds = tracking != null ? tracking!.timeTracked % 60 : 0;
    return Column(
      children: [
        Center(child: tracking != null
          ? Text("$minutes:${seconds.toString().padLeft(2, "0")} minutes travelling...")
          : Text("")
        ),
        Container(height: 10,),
        TransportTypeSwitch(onSelected: onTransportType),
        Center(child: StartStopButton(onPressed: onStartStop)),
      ],
    );
  }

  void onTransportType(TransportType tt) async {
    currentTransportType = tt;
    var i = await Tracking.getInstance();
    if (ssState == .start) {
      // Callback to just trigger an update
      i.startTracking(tt, () => setState(() {}));
    }
  }

  void onStartStop(StartStop ss) async {
    var i = await Tracking.getInstance();
    ssState = ss;
    if (ss == .start) {
      // Callback to just trigger an update
      i.startTracking(currentTransportType, () => setState(() {}));
    } else {
      i.stopTracking(currentTransportType);
    }
  }
}
