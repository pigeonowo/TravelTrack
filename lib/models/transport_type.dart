enum TransportType {
  walking,
  waiting,
  bus,
  car,
  train,
  plane,
}

String transportTypeToString(TransportType tt) {
  return switch (tt) {
    .walking => "Walking",
    .bus => "Bus",
    .car => "Car",
    .plane => "Plane",
    .waiting => "Waiting",
    .train => "Train",
    //_ => "Unknown Transporttype"
  };
}

TransportType defaultTransportType() {
  return .walking;
}