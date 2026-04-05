import 'package:travel_track/models/transport_type.dart';

typedef Seconds = int;

class Tracking {
  factory Tracking() {
    _instance ??= Tracking._makeInstance();
    return _instance!;
  }
  Tracking._makeInstance();

  static Tracking? _instance;

  Map<TransportType, Seconds> traveldata = {};

  void recordTime(TransportType tt, Seconds amount) {
    traveldata.putIfAbsent(tt, () => 0);
    traveldata[tt] = traveldata[tt]! + amount;
  }

  void startTracking(TransportType tt) {}
  void stopTracking(TransportType tt) {}
}