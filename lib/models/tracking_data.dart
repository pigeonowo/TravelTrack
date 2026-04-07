import 'package:travel_track/models/transport_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef Seconds = int;

/// Singleton to Store all tracking related Data.
///
/// It uses [SharedPreferances] under the hood to store the data.
class TrackingData {
  static Future<TrackingData> getInstance() async {
    var sp = await SharedPreferences.getInstance();
    _instance ??= TrackingData._makeInstance(sp);
    return _instance!;
  }

  TrackingData._makeInstance(this.store) {
    for (var tt in TransportType.values) {
      var ttRes = store.getInt("${tt}td");
      if (ttRes == null) {
        store.setInt("${tt}td", 0);
        traveldata[tt] = 0;
      } else {
        traveldata[tt] = ttRes;
      }
    }
  }

  static TrackingData? _instance;

  Map<TransportType, Seconds> traveldata = {};
  final SharedPreferences store;

  Seconds operator [](TransportType tt) {
    return traveldata[tt] ?? 0;
  }

  Seconds getTotal() {
    return traveldata.values.fold(0, (x, y) => x + y);
  }

  void operator []=(TransportType tt, Seconds amount) {
    traveldata[tt] = amount;
    store.setInt("${tt}td", amount);
  }

  void add(TransportType tt, Seconds amount) {
    traveldata[tt] = (traveldata[tt] ?? 0) + amount;
    // can not be null because it gets set above
    store.setInt("${tt}td", traveldata[tt]!);
  }
}
