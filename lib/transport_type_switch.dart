import 'package:flutter/material.dart';
import 'package:travel_track/models/transport_type.dart';

class TransportTypeSwitch extends StatefulWidget {
  const TransportTypeSwitch({super.key, required this.onSelected});

  final void Function(TransportType) onSelected;

  @override
  State<TransportTypeSwitch> createState() {
    return _TransportTypeSwitchState();
  }
}

class _TransportTypeSwitchState extends State<TransportTypeSwitch> {
  TransportType state = .walking;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: defaultTransportType(),
      onSelected: onSelected,
      dropdownMenuEntries: [
        for (var tt in TransportType.values)
          DropdownMenuEntry(label: transportTypeToString(tt), value: tt),
      ]
    );
  }

  void onSelected(TransportType? tt) {
    //setState(() {
    if (tt != null) {
      state = tt;
      widget.onSelected(state);
    }
    //});
  }
}
