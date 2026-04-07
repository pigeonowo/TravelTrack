import 'package:flutter/material.dart';

enum TransportType {
  walking,
  waiting,
  bus,
  car,
  train,
  plane;

  static TransportType defaultType() {
    return .walking;
  }

  @override
  String toString() {
    return switch (this) {
      .walking => "Walking",
      .bus => "Bus",
      .car => "Car",
      .plane => "Plane",
      .waiting => "Waiting",
      .train => "Train",
      //_ => "Unknown Transporttype"
    };
  }

  Color toColor() {
    return switch (this) {
      .car => Colors.blue,
      .bus => Colors.purple,
      .plane => const Color.fromARGB(255, 225, 199, 0),
      .train => Colors.red,
      .waiting => Colors.green,
      .walking => const Color.fromARGB(255, 46, 181, 147),
    };
  }
}
