import 'package:flutter/material.dart';
import 'package:travel_track/models/tracking_data.dart';
import 'package:travel_track/models/transport_type.dart';

class TransportTypeStatDisplay extends StatelessWidget {
  const TransportTypeStatDisplay({
    super.key,
    required this.transportType,
    required this.seconds,
  });

  final TransportType transportType;
  final Seconds seconds;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 125,
      decoration: BoxDecoration(color: transportType.toColor()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "${transportType.toString()}:",
                style: TextStyle(
                  fontWeight: .bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                "${(seconds / 60 / 60).toStringAsFixed(1)} Hours",
                style: TextStyle(
                  fontWeight: .bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
