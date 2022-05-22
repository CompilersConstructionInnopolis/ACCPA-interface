import 'package:advanced_compilers_web/widget/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

import '../const/syntax_highlighting.dart';
import '../util/insert_indentation_fix.dart';
import '../controller/tab_controller.dart' as tab_controller;
import '../entity/tab.dart' as tab_model;

class SourceArea extends StatelessWidget {
  final tabController = Get.find<tab_controller.TabController>();
  final int tabSpaces = 4;

  SourceArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RichTextController _controller = RichTextController(
      text: tabController.getCode(),
      patternMatchMap: SyntaxHighlighting.codePatterns,
      onMatch: (List<String> matches) {
        print("matches: ${matches}");
      },
    );
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600]!, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffeeeeee),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 42,
            child: TabView(sourceCodeController: _controller),
          ),
          Expanded(
            flex: 12,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                _controller.text = tabController.getCode();
                // _controller.selection = tabController.getCodeSelection();
                return Actions(
                  actions: {InsertIndentationIntent: InsertIndentationAction()},
                  child: Shortcuts(
                    shortcuts: {
                      LogicalKeySet(LogicalKeyboardKey.tab): InsertIndentationIntent(tabSpaces, _controller),
                    },
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyText1,
                      cursorColor: Colors.grey[600],
                      controller: _controller,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration.collapsed(hintText: ""),
                      onChanged: (String code) => _sourceChanged(code, _controller),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  _sourceChanged(code, RichTextController _controller) {
    print("source changed: $code");
    // tabController.setCode(code);
    // _lastSelectionPosition = _controller.selection;
  }
}
