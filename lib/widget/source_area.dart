import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

import '../const/code_patterns.dart';
import '../util/insert_tab_fix.dart';

class SourceArea extends StatelessWidget {
  final RichTextController _controller = RichTextController(
    patternMatchMap: CodePatterns.codePatterns,
    onMatch: (List<String> matches) {
      print("matches: ${matches}");
    },
  );
  final int tabSpaces = 4;

  SourceArea({
    Key? key,
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
            shortcuts: {LogicalKeySet(LogicalKeyboardKey.tab): InsertTabIntent(tabSpaces, _controller)},
            child: TextField(
              style: Theme.of(context).textTheme.bodyText1,
              cursorColor: Colors.grey[600],
              controller: _controller,
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
