import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/app_const.dart';
import '../entity/tab.dart' as tab_model;

class TabController extends GetxController {
  final tabs = <tab_model.Tab>[AppConst.defaultTab].obs;
  final currentTabIndex = 0.obs;

  // final _lastSelectionPosition = TextSelection.fromPosition(const TextPosition(offset: 0)).obs;

  createNewTab({required String title}) {
    tabs.value.add(tab_model.Tab(title: title, content: ''));
    currentTabIndex.value = tabs.value.length - 1;
    tabs.refresh();
    currentTabIndex.refresh();
  }

  removeTab(tab_model.Tab tab) {
    if (isRestricted(tab)) {
      Get.snackbar(
        AppConst.sorry,
        AppConst.restrictedTabMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 18),
      );

      return;
    }
    tabs.value.remove(tab);
    currentTabIndex.value = tabs.value.indexWhere((t) => t.title == 'main');
    tabs.refresh();
  }

  selectTab(tab_model.Tab tab) {
    currentTabIndex.value = tabs.value.indexOf(tab);
    currentTabIndex.refresh();
  }

  saveCode(String code) {
    tabs.value[currentTabIndex.value] = tabs.value[currentTabIndex.value].copyWith(content: code);
    tabs.refresh();
  }

  String getCode() {
    return tabs.value[currentTabIndex.value].content ?? "";
  }

  int getCurrentTabIndex() {
    return currentTabIndex.value;
  }

  List<tab_model.Tab> getTabs() {
    return tabs.value;
  }

  bool isRestricted(tab_model.Tab tab) {
    return AppConst.restrictedTabTitles.contains(tab.title);
  }
}
