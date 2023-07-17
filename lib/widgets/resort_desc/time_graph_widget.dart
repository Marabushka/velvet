import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_style.dart';

Widget timeGraphWidget() {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      decoration: BoxDecoration(color: CustomColors.lightBlue),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Text(
              'ППКД №5 (экскурсионная, кафе "Веста", трассы 1, 4, 5, 10, 11)*',
              style: CustomStyle.black16,
            )),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  '09.00–17.00',
                  style: CustomStyle.black16,
                ),
                Container(
                  width: 100,
                  child: Flexible(
                    child: Text(
                      'Четверг: профилактика',
                      style: CustomStyle.black16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
