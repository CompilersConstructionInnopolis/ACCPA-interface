import 'package:flutter/material.dart';

class InsertIndentationIntent extends Intent {
  const InsertIndentationIntent(this.numSpaces, this.textController);
  final int numSpaces;
  final TextEditingController textController;
}

class InsertIndentationAction extends Action {
  @override
  Object invoke(covariant Intent intent) {
    if (intent is InsertIndentationIntent) {
      final oldValue = intent.textController.value;
      final newComposing = TextRange.collapsed(oldValue.composing.start);
      final newSelection = TextSelection.collapsed(
          offset: oldValue.selection.start + intent.numSpaces);

      final newText = StringBuffer(oldValue.selection.isValid
          ? oldValue.selection.textBefore(oldValue.text)
          : oldValue.text);
      for (var i = 0; i < intent.numSpaces; i++) {
        newText.write(' ');
      }
      newText.write(oldValue.selection.isValid
          ? oldValue.selection.textAfter(oldValue.text)
          : '');
      intent.textController.value = intent.textController.value.copyWith(
        composing: newComposing,
        text: newText.toString(),
        selection: newSelection,
      );
    }
    return '';
  }
}