import 'package:advanced_compilers_web/page/source_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import '../controller/tab_controller.dart' as tab_controller;
import 'controller/compiler_controller.dart';

void main() {
  Get.put(tab_controller.TabController());
  Get.put(Dio());
  Get.put(CompilerController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Plus++ interface',
      theme: ThemeData(
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
            fontFamily: 'Hind',
            letterSpacing: 2,
          ),
          bodyText1: GoogleFonts.courierPrime(),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.deepPurpleAccent),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: SourcePage(),
    );
  }
}
