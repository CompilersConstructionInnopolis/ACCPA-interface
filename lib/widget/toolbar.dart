import 'package:advanced_compilers_web/widget/source_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

import '../const/app_const.dart';
import '../const/syntax_highlighting.dart';
import '../controller/compiler_controller.dart';
import '../controller/tab_controller.dart' as tab_controller;

class ToolBar extends StatelessWidget {
  final CompilerController compilerController = Get.find();
  final tabController = Get.find<tab_controller.TabController>();
  final RichTextController sourceCodeController;

  ToolBar({
    Key? key,
    required this.sourceCodeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          child: Obx(() {
            tabController.getCode();
            return TextButton(
              child: const Icon(Icons.play_arrow),
              onPressed: () => _compilePressed(context),
            );
          }),
        ),
      ],
    );
  }

  _compilePressed(context) {
    if (sourceCodeController.text.isNotEmpty) {
      tabController.saveCode(sourceCodeController.text);
    }
    compilerController.requestCompile();
    Get.snackbar(
      AppConst.running,
      AppConst.itMayTakeTime,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(Icons.circle, color: Theme.of(context).colorScheme.secondary),
      shouldIconPulse: true,
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 18),
    );
  }
}
