import 'package:flutter/material.dart';
import 'package:travel_track/models/transport_type.dart';

class TransportTypeStatDisplay extends StatelessWidget {
  const TransportTypeStatDisplay({
    super.key,
    required this.transportType,
    required this.hours,
  });

  final TransportType transportType;
  final double hours;

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
                "$hours Hours",
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
