import 'package:flutter/material.dart';

class SyntaxHighlighting {
  static const List<String> operators = [
    "Int",
    "Double",
    "Num",
    "Boolean",
    "Unit",
    "String",
    "Any",
    "quote",
    "setq",
    "func",
    "lambda",
    "prog",
    "cond",
    "return",
    "type",
    "functype",
    "define",
  ];

  static get codePatterns => {
        RegExp(r"\bmain\b"): const TextStyle(color: Colors.deepPurpleAccent),
        RegExp(r'\".*\"'): const TextStyle(color: Colors.deepPurpleAccent),
        RegExp(r'>.*'): const TextStyle(color: Colors.red),
        RegExp(r"\B#[a-zA-Z0-9]+\b"): const TextStyle(color: Colors.red),
        RegExp(r";.*"): const TextStyle(color: Colors.green),
        RegExp(r"\("): const TextStyle(color: Colors.blue),
        RegExp(r"\)"): const TextStyle(color: Colors.blue),
        RegExp(r"\b(" + operators.join("|") + r")\b"): const TextStyle(color: Colors.deepOrange),
      };
}
