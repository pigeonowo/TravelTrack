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
}
