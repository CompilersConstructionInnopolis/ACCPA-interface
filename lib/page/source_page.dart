import 'package:advanced_compilers_web/widget/source_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

import '../const/app_const.dart';
import '../const/syntax_highlighting.dart';
import '../controller/compiler_controller.dart';
import '../controller/tab_controller.dart' as tab_controller;

class SourcePage extends StatelessWidget {
  final CompilerController compilerController = Get.find();
  final tab_controller.TabController tabController = Get.find();

  @override
  Widget build(BuildContext context) {
    final RichTextController _sourceCodeController = RichTextController(
      text: tabController.getCode(),
      patternMatchMap: SyntaxHighlighting.codePatterns,
      onMatch: (List<String> matches) {},
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Text(
                          "+++",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      _toolBar(context, _sourceCodeController),
                    ],
                  ),
                ),
                // Text("Source code", style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 20),
                Expanded(
                  flex: 30,
                  child: SourceArea(sourceCodeController: _sourceCodeController),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _toolBar(context, _sourceCodeController) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          child: TextButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              tabController.setCode(_sourceCodeController.text);
              compilerController.requestCompile();
              Get.snackbar(
                AppConst.running,
                AppConst.itMayTakeTime,
                snackPosition: SnackPosition.BOTTOM,
                icon: Icon(Icons.circle, color: Theme.of(context).colorScheme.secondary),
                shouldIconPulse: true,
                margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 18),
              );
            },
          ),
        ),
      ],
    );
  }
}
