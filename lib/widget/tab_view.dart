import 'package:advanced_compilers_web/widget/tab_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/tab_controller.dart' as tab_controller;
import '../entity/tab.dart' as tab_model;
import 'add_button.dart';

class TabView extends StatelessWidget {
  final tabController = Get.find<tab_controller.TabController>();

  TabView({Key? key}) : super(key: key);

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
                onPressed: _addPressed,
              ),
            ],
          ),
        );
      }),
    );
  }

  _tabPressed(tab) {
    print("this tab pressed");
    tabController.selectTab(tab);
  }

  _addPressed() {
    print("add button pressed");
    tabController.createNewTab(title: 'file_');
  }
}
