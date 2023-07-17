import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_icons_icons.dart';
import 'package:velvet/static/custom_style.dart';
import 'package:velvet/widgets/resort_desc/resort_description_widget.dart';

class ResortCardWidget extends StatefulWidget {
  final String name;
  final String range;
  final List<String> tags;
  final List<IconData> iconsLeft;
  final List<IconData> iconsRight;
  final String src;
  bool isFavorite;

  ResortCardWidget(
      {super.key,
      required this.isFavorite,
      required this.name,
      required this.range,
      required this.src,
      required this.iconsLeft,
      required this.iconsRight,
      required this.tags});

  @override
  State<ResortCardWidget> createState() => _ResortCardWidgetState();
}

class _ResortCardWidgetState extends State<ResortCardWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResortDescription(
                  src: widget.src,
                  name: widget.name,
                  range: widget.range,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(widget.name, style: CustomStyle.blackBold22),
                Text('${widget.range} км', style: CustomStyle.black16)
              ],
            ),
            const Row(
              children: [
                Text('Регион', style: CustomStyle.black16),
                SizedBox(
                  width: 8,
                ),
                Text('Сейчас сезон', style: CustomStyle.orrange15)
              ],
            ),
            SizedBox(height: 12),
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    widget.src,
                    fit: BoxFit.cover,
                    width: screenWidth,
                    height: 194,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.isFavorite = !widget.isFavorite;
                              });
                            },
                            icon: Icon(
                              CustomIcons.favorite,
                              size: 16,
                              color: widget.isFavorite
                                  ? Colors.black
                                  : CustomColors.orrange,
                            ),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: screenWidth,
                    child: Wrap(
                      //spacing: 8,
                      alignment: WrapAlignment.spaceBetween,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.up,

                      children: [
                        Container(
                          width: screenWidth * 0.4,
                          child: Wrap(
                            verticalDirection: VerticalDirection.up,
                            alignment: WrapAlignment.start,
                            children: [
                              for (var icon in widget.iconsLeft)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, top: 8),
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    child: Icon(
                                      icon,
                                      size: 18,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.4,
                          child: Wrap(
                            textDirection: TextDirection.rtl,
                            verticalDirection: VerticalDirection.up,
                            children: [
                              for (var icon in widget.iconsRight)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, top: 8),
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    child: Icon(
                                      icon,
                                      size: 18,
                                      color: CustomColors.blue,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                for (var i in widget.tags)
                  Padding(
                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: CustomColors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                          i,
                          style: CustomStyle.blue13,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
