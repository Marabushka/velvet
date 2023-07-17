import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_icons_icons.dart';
import 'package:velvet/static/custom_style.dart';

Widget webCamersWisget() {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      color: CustomColors.lightGrey,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Канатная дорога № 7 «КОМЕТА»',
                style: CustomStyle.black14,
              ),
              Icon(
                CustomIcons.play,
                size: 35,
                color: CustomColors.blue,
              )
            ]),
      ),
    ),
  );
}
