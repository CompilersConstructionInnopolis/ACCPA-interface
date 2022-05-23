import 'package:advanced_compilers_web/controller/tab_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../entity/tab.dart' as tab_model;

class CompilerController extends GetxController {
  final TabController tabController = Get.find();
  final Dio dio = Get.find();

  final String baseUrl = "https://accpa-backend.herokuapp.com";

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
    } catch (error) {
      print(error);
    }
  }
}
