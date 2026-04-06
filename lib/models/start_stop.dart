enum StartStop {
  start,
  stop;

  StartStop operator ~() {
    if (this == .start) {
      return .stop;
    } else {
      return .start;
    }
  }

  @override
  String toString() {
    if (this == .start) {
      return "Start";
    } else {
      return "Stop";
    }
  }
}
