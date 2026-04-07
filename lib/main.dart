import 'package:flutter/material.dart';
import 'package:travel_track/control_panel.dart';
import "dart:io";

import 'package:travel_track/image_background.dart';
import 'package:travel_track/transport_type_stat_display.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Cur dir: ${Directory.current}");
    const bannerPath = "assets/test-banner.png";
    const backgroundImageTextStyle = TextStyle(
      fontWeight: .bold,
      fontSize: 18,
      color: Colors.white,
    );

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
                  Text("100.5 Hours", style: backgroundImageTextStyle),
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
                        hours: 7,
                      ),
                      TransportTypeStatDisplay(
                        transportType: .waiting,
                        hours: 130.3,
                      ),
                      TransportTypeStatDisplay(
                        transportType: .car,
                        hours: 2300.3,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      TransportTypeStatDisplay(
                        transportType: .bus,
                        hours: 32.7,
                      ),
                      //TransportTypeStatDisplay(transportType: .bus, hours: 11.3),
                      TransportTypeStatDisplay(transportType: .plane, hours: 5),
                      TransportTypeStatDisplay(
                        transportType: .train,
                        hours: 190,
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
