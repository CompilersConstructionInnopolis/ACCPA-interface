import 'package:advanced_compilers_web/widget/source_area.dart';
import 'package:flutter/material.dart';

class SourcePage extends StatelessWidget {
  final sourceAreaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Plus++", style: Theme.of(context).textTheme.headline1),
                Text("Source code", style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 20),
                Expanded(
                  child: SourceArea(
                    controller: sourceAreaController,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
