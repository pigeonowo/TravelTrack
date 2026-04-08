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
      menuStyle: MenuStyle(
        backgroundColor: .all(const Color.fromARGB(255, 228, 246, 253)),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        fillColor: const Color.fromARGB(255, 216, 243, 255),
        border: OutlineInputBorder(borderRadius: const .all(.circular(25))),
      ),
      initialSelection: TransportType.defaultType(),
      onSelected: onSelected,
      dropdownMenuEntries: [
        for (var tt in TransportType.values)
          DropdownMenuEntry(label: tt.toString(), value: tt),
      ],
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
