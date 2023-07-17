import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_style.dart';
import 'package:velvet/widgets/resort_desc/price_count_widget.dart';
import 'package:velvet/widgets/resort_desc/price_hour_widget.dart';
import 'package:velvet/widgets/resort_desc/price_season_widget.dart';

class SkiPassWidget extends StatefulWidget {
  const SkiPassWidget({super.key});

  @override
  State<SkiPassWidget> createState() => _SkiPassWidgetState();
}

class _SkiPassWidgetState extends State<SkiPassWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        child: ListView(
          children: [
            const Text(
              'Для пользования абонементами необходимо купить ски-пасс - карту, на которую вносятся данные о соответсвующем типе абонемента. Стоимость карты — 170 рублей.',
              style: CustomStyle.black13,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.max,
              children: [
                const Text('Почасовой', style: CustomStyle.blackBold18),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Будни', style: CustomStyle.grey10),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Выходные', style: CustomStyle.grey10),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
            priceHourWidget(),
            priceHourWidget(),
            priceHourWidget(),
            priceHourWidget(),
            const SizedBox(height: 10),
            const Text(
              'По числу подъемов',
              style: CustomStyle.blackBold18,
            ),
            priceCountWidget(),
            priceCountWidget(),
            priceCountWidget(),
            const SizedBox(height: 10),
            const Text(
              'Теперь ски-пасс не именной, так что можно не переживать, что не откатаете все подъемы — просто воспользуйтесь помощью друга!',
              style: CustomStyle.black13,
            ),
            const SizedBox(height: 10),
            const Text(
              'Сезонный',
              style: CustomStyle.blackBold18,
            ),
            priceSeasonWidget(),
            priceSeasonWidget(),
            const SizedBox(height: 10),
            const Text(
              'Особые тарифы',
              style: CustomStyle.blackBold18,
            ),
            priceSeasonWidget(),
            priceSeasonWidget(),
            const SizedBox(
              height: 10,
            ),
            Container(
              // width: screenWidth * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Интерактивная карта',
                    style: CustomStyle.blackBold18),
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
      ),
    );
  }
}
