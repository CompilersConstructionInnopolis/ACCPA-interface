import 'package:advanced_compilers_web/source_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const/code_patterns.dart';

void main() {
  // print(CodePatterns.operators.join("|"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plus++ interface',
      theme: ThemeData(
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.grey[600]),
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
