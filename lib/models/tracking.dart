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

  // TODO
  void startTracking(TransportType tt) {
    if (tt != currentlyTracking) {
      if (currentlyTrackingTimer != null) {
        currentlyTrackingTimer!.cancel();
      }
      currentlyTracking = tt;
      currentlyTrackingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        print("Hi - $currentlyTracking");
      });
    }
  }

  void stopTracking(TransportType tt) {
    currentlyTracking = null;
    if (currentlyTrackingTimer != null) {
      currentlyTrackingTimer!.cancel();
    }
    currentlyTrackingTimer = null;
  }
}
