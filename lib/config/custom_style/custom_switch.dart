import 'package:flutter/material.dart';

class GenderSwitch extends StatefulWidget {
  final bool voiceAssistant;
  final Function(bool) onChanged;

  const GenderSwitch({
    Key? key,
    required this.voiceAssistant,
    required this.onChanged,
  }) : super(key: key);

  @override
  _GenderSwitchState createState() => _GenderSwitchState();
}

class _GenderSwitchState extends State<GenderSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.voiceAssistant);
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: widget.voiceAssistant ? Colors.pink : Colors.blue,
        ),
        child: Row(
          mainAxisAlignment:
          widget.voiceAssistant ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.male,
                color: widget.voiceAssistant ? Colors.black : Colors.white,
                size: 30,
              ),
            ),
            Text(
              'Male',
              style: TextStyle(
                color: widget.voiceAssistant ? Colors.black : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.female,
                color: widget.voiceAssistant ? Colors.white : Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
