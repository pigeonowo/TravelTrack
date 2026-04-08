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
  /// Total seconds spend in current travel until [stopTracking] is called.
  /// 
  /// Does not care about which [TransportType] is selected.
  int timeTracked = 0;

  void recordTime(TransportType tt, Seconds amount) {
    trackingData[tt] = trackingData[tt] + amount;
  }

  // TODO
  void startTracking(TransportType tt, void Function() callback) {
    if (tt != currentlyTracking) {
      currentlyTracking = tt;
      
      currentlyTrackingTimer ??= Timer.periodic(Duration(seconds: 1), (timer) {
        recordTime(currentlyTracking!, 1);
        timeTracked++;
        callback();
      });
    
    }
  }

  void stopTracking(TransportType tt) {
    currentlyTracking = null;
    if (currentlyTrackingTimer != null) {
      currentlyTrackingTimer!.cancel();
    }
    currentlyTrackingTimer = null;
    timeTracked = 0;
  }
}
