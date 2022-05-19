import 'package:flutter/material.dart';

class CodePatterns {
  // static get operatorsRegex => r"(\b"
  // r"setq"
  // r"\b|\b"
  // r"and"
  // r"\b|\b"
  // r"or"
  // r"\b|\b"
  // r"xor"
  // r"\b)";

  static get codePatterns => {
        RegExp(r"\B#[a-zA-Z0-9]+\b"): const TextStyle(color: Colors.red),
        RegExp(r"\("): const TextStyle(color: Colors.blue),
        RegExp(r"\)"): const TextStyle(color: Colors.blue),
        RegExp(r"\["): const TextStyle(color: Colors.blue),
        RegExp(r"\]"): const TextStyle(color: Colors.blue),
        RegExp(r'\b(and|or|xor|for|do|while|foreach|as|return|die|exit|if|then|else|elseif|new|delete|try|throw|catch|finally|class|function|string|array|object|resource|var|bool|boolean|int|integer|float|double|real|string|array|global|const|static|public|private|protected|published|extends|switch|true|false|null|void|this|self|struct|char|signed|unsigned|short|long)\b'): const TextStyle(color: Colors.deepOrange),
        // RegExp(r"^" + operatorsRegex + r"$"): const TextStyle(color: Colors.deepOrange),
        // RegExp(r"^" + operators): const TextStyle(color: Colors.deepOrange),
        // RegExp(operators + r"$"): const TextStyle(color: Colors.deepOrange),
      };
}
