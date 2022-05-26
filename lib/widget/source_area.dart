import 'package:advanced_compilers_web/widget/tab_view.dart';
import 'package:advanced_compilers_web/widget/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

import '../const/syntax_highlighting.dart';
import '../controller/compiler_controller.dart';
import '../util/insert_indentation_fix.dart';
import '../controller/tab_controller.dart' as tab_controller;

class SourceArea extends StatelessWidget {
  final tabController = Get.find<tab_controller.TabController>();
  final CompilerController compilerController = Get.find();

  final int tabSpaces = 4;
  final RichTextController sourceCodeController;

  SourceArea({
    Key? key,
    required this.sourceCodeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600]!, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffeeeeee),
      ),
      child: ResizableWidget(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 42,
                    child: TabView(sourceCodeController: sourceCodeController),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Obx(() {
                        sourceCodeController.text = tabController.getCode();
                        return Actions(
                          actions: {InsertIndentationIntent: InsertIndentationAction()},
                          child: Shortcuts(
                            shortcuts: {
                              LogicalKeySet(LogicalKeyboardKey.tab):
                                  InsertIndentationIntent(tabSpaces, sourceCodeController),
                            },
                            child: TextField(
                              style: Theme.of(context).textTheme.bodyText1,
                              cursorColor: Colors.grey[600],
                              cursorHeight: 11,
                              controller: sourceCodeController,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration.collapsed(hintText: ""),
                              onChanged: (String code) => _sourceChanged(code, sourceCodeController),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 42,
                child: Container(
                  width: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xffb2b2b2),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      for (int i = 0; i < 131; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              "$i",
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 42,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!, width: 2),
                  color: Colors.grey[400]!,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Output",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      ToolBar(sourceCodeController: sourceCodeController),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: Obx(() {
                        final _outputFieldController =
                            TextEditingController(text: compilerController.compilationOutput());
                        return TextField(
                          readOnly: true,
                          controller: _outputFieldController,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.start,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration.collapsed(hintText: ""),
                          cursorColor: Colors.grey[600],
                          cursorHeight: 11,
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        separatorColor: Colors.grey[600]!,
        separatorSize: 2,
        isHorizontalSeparator: true,
        percentages: const [0.7, 0.3],
      ),
    );
  }

  _sourceChanged(code, RichTextController _controller) {
    print("source changed: $code");
  }
}
