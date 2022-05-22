import 'package:flutter/material.dart';

class SyntaxHighlighting {
  static const List<String> operators = [
        "and",
        "or",
        "xor",
        "not",
        "setq",
      ];

  static get codePatterns => {
        RegExp(r"\B#[a-zA-Z0-9]+\b"): const TextStyle(color: Colors.red),
        RegExp(r"\("): const TextStyle(color: Colors.blue),
        RegExp(r"\)"): const TextStyle(color: Colors.blue),
        RegExp(r"\["): const TextStyle(color: Colors.blue),
        RegExp(r"\]"): const TextStyle(color: Colors.blue),
        RegExp(r"\b(" + operators.join("|") + r")\b"): const TextStyle(color: Colors.deepOrange),
      };
}
