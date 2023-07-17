import 'package:flutter/material.dart';
import 'package:velvet/static/custom_style.dart';
import 'package:velvet/widgets/resort_desc/web_cameras_widget.dart';

import '../../static/custom_colors.dart';
import '../track_card_widget.dart';

class TracksWidget extends StatelessWidget {
  const TracksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Трассы',
                style: CustomStyle.blackBold18,
              ),
              Row(
                children: [
                  Text('Длина', style: CustomStyle.grey10),
                  SizedBox(
                    width: 25,
                  ),
                  Text('Перепад высот', style: CustomStyle.grey10)
                ],
              ),
            ],
          ),
          const TrackWidget(
            difficult: 1,
          ),
          const TrackWidget(
            difficult: 2,
          ),
          const TrackWidget(
            difficult: 3,
          ),
          const TrackWidget(
            difficult: 4,
          ),
          const TrackWidget(
            difficult: 1,
          ),
          const TrackWidget(
            difficult: 2,
          ),
          const SizedBox(height: 20),
          const Text('Дополнительно', style: CustomStyle.blackBold18),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(
                Icons.map,
                size: 34,
              ),
              SizedBox(
                width: 20,
              ),
              Text('Вечернее катание', style: CustomStyle.black15)
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.map,
                size: 34,
              ),
              SizedBox(
                width: 20,
              ),
              Text('Искусственное оснежение склонов',
                  style: CustomStyle.black15)
            ],
          ),
          const SizedBox(height: 10),
          webCamersWisget(),
          webCamersWisget(),
          webCamersWisget(),
          const SizedBox(
            height: 10,
          ),
          Container(
            // width: screenWidth * 0.9,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  Text('Интерактивная карта', style: CustomStyle.blackBold18),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(CustomColors.lightGrey),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
