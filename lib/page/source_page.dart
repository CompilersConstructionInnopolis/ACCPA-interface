import 'package:advanced_compilers_web/widget/source_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

import '../const/app_const.dart';
import '../const/syntax_highlighting.dart';
import '../controller/compiler_controller.dart';
import '../controller/tab_controller.dart' as tab_controller;
import '../widget/toolbar.dart';

class SourcePage extends StatelessWidget {
  final CompilerController compilerController = Get.find();
  final tabController = Get.find<tab_controller.TabController>();
  final RichTextController _sourceCodeController = RichTextController(
    text: "",
    patternMatchMap: SyntaxHighlighting.codePatterns,
    onMatch: (List<String> matches) {},
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0).copyWith(top: 20, bottom: 48),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "+++",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SourceArea(sourceCodeController: _sourceCodeController),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
