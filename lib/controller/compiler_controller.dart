import 'package:advanced_compilers_web/controller/tab_controller.dart' as tab_controller;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/app_const.dart';
import '../entity/tab.dart' as tab_model;

class CompilerController extends GetxController {
  final tab_controller.TabController tabController = Get.find();
  final Dio dio = Get.find();

  final String baseUrl = "https://accpa-backend.herokuapp.com";

  final compilationOutput = "".obs;

  requestCompile() async {
    List<tab_model.Tab> tabs = tabController.getTabs();
    // print("tabs: $tabs");
    var result;
    try {
      result = await dio.post('$baseUrl/compile', data: {
        "log": true,
        "tabs": tabs,
      });
      print("result: ${result.data}");
      String title = AppConst.somethingWrong;
      String description = AppConst.unknownProblem;
      Color color = Colors.blueGrey;
      if (result.data['error'] != null) {
        title = AppConst.failed;
        description = result.data['error'].trim();
        color = Colors.redAccent;
      } else if (result.data['result'] != null) {
        title = AppConst.success;
        description = result.data['result'].trim();
        color = Colors.greenAccent;
      }
      compilationOutput.value += "[${DateTime.now()}] $description\n";
      compilationOutput.refresh();
      Get.snackbar(
        title,
        description,
        messageText: description.isNotEmpty ? Text(description) : Container(),
        icon: Icon(Icons.circle, color: color),
        snackPosition: SnackPosition.BOTTOM,
        shouldIconPulse: false,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 18),
      );
    } catch (error) {
      print("dio error: $error");
    }
  }
}
