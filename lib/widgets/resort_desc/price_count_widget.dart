import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_style.dart';

Widget priceCountWidget() {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      decoration: BoxDecoration(color: CustomColors.lightBlue),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('100 подъемов CLASSIC', style: CustomStyle.black16),
            Text('13 000р', style: CustomStyle.black16),
          ],
        ),
      ),
    ),
  );
}
