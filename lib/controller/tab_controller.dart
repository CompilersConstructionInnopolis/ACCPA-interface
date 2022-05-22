import 'package:get/get.dart';

import '../const/app_const.dart';
import '../entity/tab.dart' as tab_model;

class TabController extends GetxController {
  final tabs = <tab_model.Tab>[AppConst.defaultTab].obs;
  final currentTabIndex = 0.obs;
  static int staticTabCounter = 0; // todo сделать возможным наименование табов

  createNewTab({required String title}) {
    tabs.value.add(tab_model.Tab(title: title + "$staticTabCounter", code: ''));
    currentTabIndex.value = tabs.value.length - 1;
    tabs.refresh();
    currentTabIndex.refresh();
    staticTabCounter++;
  }

  removeTab(tab_model.Tab tab) {
    if (isRestricted(tab)) {
      Get.snackbar(AppConst.sorry, AppConst.restrictedTabMessage);
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

  setCode(String code) {
    tabs.value[currentTabIndex.value] = tabs.value[currentTabIndex.value].copyWith(code: code);
    tabs.refresh();
  }

  String getCode() {
    return tabs.value[currentTabIndex.value].code ?? "";
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
