import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_icons_icons.dart';
import 'package:velvet/static/custom_style.dart';

Widget adressWidget() {
  return const Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          CustomIcons.map_marker,
          size: 28,
          color: CustomColors.orrange,
        ),
        SizedBox(width: 18),
        Flexible(
            child: Text(
          'ул. Горнолыжная, 101, Новоабзаково, Респ. Башкортостан, 453565',
          style: CustomStyle.black14,
        ))
      ],
    ),
  );
}
