import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/insert_tab_fix.dart';

class SourceArea extends StatelessWidget {
  final TextEditingController controller;
  final int tabSpaces = 4;

  const SourceArea({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600]!, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Actions(
          actions: {InsertTabIntent: InsertTabAction()},
          child: Shortcuts(
            shortcuts: {LogicalKeySet(LogicalKeyboardKey.tab): InsertTabIntent(tabSpaces, controller)},
            child: TextField(
              style: Theme.of(context).textTheme.bodyText1,
              cursorColor: Colors.grey[600],
              controller: controller,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration.collapsed(hintText: ""),
            ),
          ),
        ),
      ),
    );
  }
}
