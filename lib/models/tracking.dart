import 'dart:async';

import 'package:travel_track/models/transport_type.dart';
import 'package:travel_track/models/tracking_data.dart';

/// Singleton that handles the "live tracking" of how much time has passed.
///
/// It uses [TrackingData] to store the data.
class Tracking {
  static Future<Tracking> getInstance() async {
    var td = await TrackingData.getInstance();
    _instance ??= Tracking._makeInstance(td);
    return _instance!;
  }

  Tracking._makeInstance(this.trackingData);

  static Tracking? _instance;

  final TrackingData trackingData;
  TransportType? currentlyTracking;
  Timer? currentlyTrackingTimer;

  void recordTime(TransportType tt, Seconds amount) {
    trackingData[tt] = trackingData[tt] + amount;
  }

  void startTracking(TransportType tt) {
    currentlyTrackingTimer = Timer.periodic(.new(seconds: 1), (timer) {
      print("Hi");
    });
  }

  void stopTracking(TransportType tt) {}
}
