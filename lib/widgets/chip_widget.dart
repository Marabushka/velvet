import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';

import '../static/custom_icons_icons.dart';

class ChipWidget extends StatefulWidget {
  final String name;
  const ChipWidget({super.key, required this.name});

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  bool isChoosed = false;
  @override
  Widget build(BuildContext context) {
    return isChoosed
        ? Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                    color: CustomColors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        CustomIcons.close,
                        size: 16,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  isChoosed = false;
                });
              },
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                    color: CustomColors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  child: Text(
                    widget.name,
                    style: TextStyle(color: CustomColors.blue),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  isChoosed = true;
                });
              },
            ),
          );
  }
}
