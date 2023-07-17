import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_style.dart';

Widget priceSeasonWidget() {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      decoration: BoxDecoration(color: CustomColors.lightBlue),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Сезонный ски-пасс взрослый', style: CustomStyle.black16),
                Text('13 000р', style: CustomStyle.black16),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Для тех, кто делает первые спуски в горах. Можно купить до 16:00',
                style: CustomStyle.grey14),
          ],
        ),
      ),
    ),
  );
}
