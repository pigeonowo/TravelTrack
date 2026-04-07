import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:travel_track/control_panel.dart';

import 'package:travel_track/image_background.dart';
import 'package:travel_track/models/tracking.dart';
import 'package:travel_track/models/tracking_data.dart';
import 'package:travel_track/transport_type_stat_display.dart';

void main() async {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    Isolate.spawn(_initState, null);
  }

  void _initState(Object? _) {
    setState(() async {
      trackingData = await .getInstance();
      tracking = await .getInstance();
    });
  }

  TrackingData? trackingData;
  Tracking? tracking;

  @override
  Widget build(BuildContext context) {
    const bannerPath = "assets/test-banner.png";
    const backgroundImageTextStyle = TextStyle(
      fontWeight: .bold,
      fontSize: 18,
      color: Colors.white,
    );

    if (tracking != null) {
      print("Tracking is not null! Updating!");
      //tracking?.recordTime(.walking, 600);
      //tracking?.recordTime(.bus, 2832);
      //tracking?.recordTime(.plane, 832);
      //tracking?.recordTime(.waiting, 9832);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TravelTrack")),
        body: Column(
          children: [
            ImageBackground(
              imagePath: bannerPath,
              width: 500,
              height: 200,
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "Total time spend Traveling:",
                    style: backgroundImageTextStyle,
                  ),
                  Text(
                    "${(trackingData != null ? trackingData!.getTotal() / 60 / 60 : 0).toStringAsFixed(1)} Hours",
                    style: backgroundImageTextStyle,
                  ),
                ],
              ),
            ),
            Container(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 5,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      TransportTypeStatDisplay(
                        transportType: .walking,
                        seconds: trackingData != null
                            ? trackingData![.walking]
                            : 0,
                      ),
                      TransportTypeStatDisplay(
                        transportType: .waiting,
                        seconds: trackingData != null
                            ? trackingData![.waiting]
                            : 0,
                      ),
                      TransportTypeStatDisplay(
                        transportType: .car,
                        seconds: trackingData != null ? trackingData![.car] : 0,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      TransportTypeStatDisplay(
                        transportType: .bus,
                        seconds: trackingData != null ? trackingData![.bus] : 0,
                      ),
                      //TransportTypeStatDisplay(transportType: .bus, hours: 11.3),
                      TransportTypeStatDisplay(
                        transportType: .plane,
                        seconds: trackingData != null
                            ? trackingData![.plane]
                            : 0,
                      ),
                      TransportTypeStatDisplay(
                        transportType: .train,
                        seconds: trackingData != null
                            ? trackingData![.train]
                            : 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            ControlPanel(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
