import 'package:advanced_compilers_web/widget/source_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Text(
                          "+++",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      _toolBar(context),
                    ],
                  ),
                ),
                // Text("Source code", style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 20),
                Expanded(
                  flex: 30,
                  child: SourceArea(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _toolBar(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          child: TextButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              Get.snackbar(
                "Running...",
                "it may take a couple of seconds",
                snackPosition: SnackPosition.BOTTOM,
                icon: Icon(Icons.circle, color: Theme.of(context).colorScheme.secondary),
                shouldIconPulse: true,
                margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 18),
              );
            },
          ),
        ),
      ],
    );
  }
}
