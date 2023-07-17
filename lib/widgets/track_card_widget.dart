import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_style.dart';

class TrackWidget extends StatefulWidget {
  final int difficult;
  const TrackWidget({super.key, required this.difficult});

  @override
  State<TrackWidget> createState() => _TrackWidgetState();
}

class _TrackWidgetState extends State<TrackWidget> {
  bool isExpanded = false;
  Color? color;
  getColor(int dific) {
    dific == 1
        ? color = CustomColors.green
        : dific == 2
            ? color = CustomColors.blue
            : dific == 3
                ? color = CustomColors.orrange
                : color = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    getColor(widget.difficult);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: CustomColors.lightBlue),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            border: Border.all(color: color!, width: 3),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Text(
                            '${widget.difficult}',
                            style: TextStyle(color: color),
                          )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Учебный склон', style: CustomStyle.grey12),
                            Text('Восточная', style: CustomStyle.black14),
                          ],
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          '259 м',
                          style: CustomStyle.black14,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '1370 м',
                          style: CustomStyle.black14,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: isExpanded
                  ? Column(
                      children: [
                        SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Подъемники', style: CustomStyle.blackBold18),
                            Row(
                              children: [
                                Text('Длина', style: CustomStyle.grey10),
                                SizedBox(
                                  width: 30,
                                ),
                                Text('Время работы', style: CustomStyle.grey10)
                              ],
                            ),
                          ],
                        ),
                        trackCard(true),
                        trackCard(false),
                        trackCard(false)
                      ],
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}

Widget trackCard(bool isOpen) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      decoration: BoxDecoration(color: CustomColors.lightBlue),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.map,
                  size: 32,
                ),
                SizedBox(
                  width: 20,
                ),
                isOpen
                    ? const SizedBox(
                        width: 150,
                        child: Flexible(
                          child: Text('Канатная дорога А',
                              style: CustomStyle.black14),
                        ),
                      )
                    : const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Закрыта', style: CustomStyle.orrange12),
                          Text('Канатная дорога А', style: CustomStyle.grey14)
                        ],
                      )
              ],
            ),
            const Row(
              children: [
                Text(
                  '2590 м',
                  style: CustomStyle.black14,
                ),
                SizedBox(
                  width: 35,
                ),
                Column(
                  children: [
                    Text('08:15-', style: CustomStyle.black14),
                    Text('18:00', style: CustomStyle.black14),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
