import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';


class NeomorphismAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const NeomorphismAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ClayText(title),
      actions: [
        Container(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_forward), // Ikona
            color: Colors.black, // Kolor ikony
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
