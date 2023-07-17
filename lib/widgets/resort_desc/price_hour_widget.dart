import 'package:flutter/material.dart';
import 'package:velvet/static/custom_style.dart';

import '../../static/custom_colors.dart';

Widget priceHourWidget() {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      decoration: BoxDecoration(color: CustomColors.lightBlue),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('4 часа', style: CustomStyle.black16),
            Row(
              children: [
                Text('1700p', style: CustomStyle.black16),
                SizedBox(
                  width: 30,
                ),
                Text('1900p', style: CustomStyle.black16)
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
