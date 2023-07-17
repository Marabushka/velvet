import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_icons_icons.dart';
import 'package:velvet/static/custom_style.dart';
import 'package:velvet/widgets/resort_desc/adress_widget.dart';
import 'package:velvet/widgets/resort_desc/price_count_widget.dart';
import 'package:velvet/widgets/resort_desc/time_graph_widget.dart';

import 'contacts_widget.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
          child: ListView(
        children: [
          const Text(
            'Как добраться',
            style: CustomStyle.blackBold18,
          ),
          adressWidget(),
          adressWidget(),
          adressWidget(),
          const SizedBox(
            height: 10,
          ),
          const Text('Парковка', style: CustomStyle.blackBold18),
          const Text(
            'Оплата производится в кассе зоопарка, проката, кассах подъемников или при выезде с КПП. Чек предъявляется при выезде на КПП.',
            style: CustomStyle.black13,
          ),
          priceCountWidget(),
          priceCountWidget(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'График работы',
            style: CustomStyle.blackBold18,
          ),
          timeGraphWidget(),
          timeGraphWidget(),
          const SizedBox(
            height: 10,
          ),
          const Text('Контакты', style: CustomStyle.blackBold18),
          contactsWidget(),
          contactsWidget(),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                CustomIcons.youtube,
                size: 48,
              ),
              Icon(
                CustomIcons.telegram,
                size: 48,
              ),
              Icon(
                CustomIcons.whatsapp,
                size: 48,
              )
            ],
          ),
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
      )),
    );
  }
}
