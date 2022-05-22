import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function onPressed;

  const AddButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
          ),
          child: const Icon(
            Icons.add_outlined,
            size: 24,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
