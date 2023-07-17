import 'package:flutter/material.dart';

Widget contactsWidget() {
  return Column(
    children: [
      Row(
        children: [
          Icon(
            Icons.skip_next,
            size: 36,
          ),
          SizedBox(width: 20),
          Column(
            children: [
              Text('abzakovo.com',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    ],
  );
}
