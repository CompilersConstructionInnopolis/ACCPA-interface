import 'dart:math';

import 'package:advanced_compilers_web/widget/tab_tile.dart';
import 'package:advanced_compilers_web/widget/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

import '../const/app_const.dart';
import '../controller/tab_controller.dart' as tab_controller;
import '../entity/tab.dart' as tab_model;
import 'add_button.dart';

class TabView extends StatelessWidget {
  final tabController = Get.find<tab_controller.TabController>();

  RichTextController sourceCodeController;

  TabView({
    Key? key,
    required this.sourceCodeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Obx(() {
        final List<tab_model.Tab> tabs = tabController.getTabs();
        final List<Widget> tabWidgets = [];
        int tabIndex = 0;
        for (tab_model.Tab tab in tabs) {
          tabWidgets.add(
            Expanded(
              child: TabTile(
                tab: tab,
                active: tabIndex == tabController.getCurrentTabIndex(),
                onPressed: () => _tabPressed(tab),
              ),
            ),
          );
          tabIndex++;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ...tabWidgets,
              AddButton(
                onPressed: () => _addPressed(context),
              ),
            ],
          ),
        );
      }),
    );
  }

  _tabPressed(tab) {
    print("this tab pressed");
    tabController.saveCode(sourceCodeController.text);
    tabController.selectTab(tab);
  }

  _addPressed(context) async {
    print("add button pressed");
    TextEditingController titleFieldController = TextEditingController();
    await Get.defaultDialog(
      title: "Create new file",
      titlePadding: const EdgeInsets.only(top: 24),
      titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      content: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                child: Center(
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText1,
                    autofocus: true,
                    cursorColor: Colors.grey[600],
                    controller: titleFieldController,
                    decoration: const InputDecoration.collapsed(hintText: ""),
                    onSubmitted: (_) => Get.back(),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    String title = titleFieldController.text;
    if (!_isTitleValid(title)) {
      Get.snackbar(
        AppConst.sorry,
        AppConst.invalidFileName,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 18),
      );
      return;
    }
    tabController.saveCode(sourceCodeController.text);
    tabController.createNewTab(title: title);
  }

  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }
}
