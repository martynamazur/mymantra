import 'package:flutter/material.dart';

class  NeoSwitchStyle extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const NeoSwitchStyle({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NeoSwitchState();

}

class _NeoSwitchState  extends State<NeoSwitchStyle>{
  @override
  Widget build(BuildContext context) {
    return Switch(value: widget.value, onChanged: widget.onChanged);
  }

}