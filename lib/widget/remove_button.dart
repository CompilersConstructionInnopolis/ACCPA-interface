import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/tab_controller.dart' as tab_controller;
import '../entity/tab.dart' as tab_model;

class RemoveButton extends StatelessWidget {
  final tab_model.Tab tab;
  final tabController = Get.find<tab_controller.TabController>();

  RemoveButton({
    Key? key,
    required this.tab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _onPressed(),
        child: Container(
          child: const Icon(
            Icons.close,
            size: 18,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  _onPressed() {
    print("remove pressed for tab ${tab.title}");
    tabController.removeTab(tab);
  }
}
