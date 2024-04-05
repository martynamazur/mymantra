import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PrimaryAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
                fontSize: 24,
                letterSpacing: 0.08,
                fontWeight: FontWeight.w400,
                color: Color(0xFF55606C)),
          ),
          const Spacer(), // Dodaje przestrzeń między tytułem a przyciskami akcji
          // Tutaj można umieścić dodatkowe przyciski akcji
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
