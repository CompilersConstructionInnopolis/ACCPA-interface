import 'package:advanced_compilers_web/widget/remove_button.dart';
import 'package:flutter/material.dart';
import '../entity/tab.dart' as tab_model;

class TabTile extends StatelessWidget {
  final tab_model.Tab tab;
  final Function onPressed;
  final bool active;

  const TabTile({
    Key? key,
    required this.tab,
    required this.active,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => onPressed(),
            child: Container(
              decoration: BoxDecoration(
                color: active ? const Color(0xffeeeeee) : Colors.white38,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Stack(children: [
                Positioned(
                  child: RemoveButton(tab: tab),
                  right: 10,
                  bottom: 6,
                ),
                Center(
                  child: Text(
                    tab.title ?? "unnamed",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
