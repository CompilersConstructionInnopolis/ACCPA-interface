import 'package:advanced_compilers_web/widget/source_area.dart';
import 'package:flutter/material.dart';

class SourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text("+++", style: Theme.of(context).textTheme.headline6),
                ),
                // Text("Source code", style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 20),
                Expanded(
                  flex: 25,
                  child: SourceArea(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
