import 'package:flutter/material.dart';
import 'package:travel_track/control_panel.dart';
import "dart:io";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Cur dir: ${Directory.current}");
    var banner = File("./test-banner.png");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TravelTrack")
        ),
        body: Column(
          children: [
            Text(
              "Total time spend Travelin...", 
              style: TextStyle(fontWeight: .bold, fontSize: 18),
            ),
            Image.file(banner),
            Text(
              "Spend XXX hours with XXX",
              style: TextStyle(fontWeight: .bold, fontSize: 18),
            ),
            Row(children: [
              Icon(Icons.arrow_left),
              Expanded(
                child: Image.file(banner),
              ),
              Icon(Icons.arrow_right),
            ],),
            Spacer(),
            ControlPanel(),
            Spacer(),
          ]
        ),
      ),
    );
  }


}
