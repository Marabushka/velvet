import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_style.dart';
import 'package:velvet/widgets/chip_widget.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  bool nearToAir = false;
  bool leaveNear = false;
  bool hasHire = false;
  bool hasSchool = false;
  List<Widget> seasonChips = const [
    ChipWidget(name: 'Октябрь'),
    ChipWidget(name: 'Ноябрь'),
    ChipWidget(name: 'Декабрь'),
    ChipWidget(name: 'Январь'),
    ChipWidget(name: 'Март'),
    ChipWidget(name: 'Апрель'),
    ChipWidget(name: 'Май'),
    ChipWidget(name: 'Июнь'),
  ];
  List<Widget> regionChips = const [
    ChipWidget(name: 'Кавказ'),
    ChipWidget(name: 'Северо-Запад'),
    ChipWidget(name: 'Урал'),
    ChipWidget(name: 'Сибирь'),
    ChipWidget(name: 'Поволжье'),
    ChipWidget(name: 'Дальний восток'),
  ];
  List<Widget> trackChips = const [
    ChipWidget(name: 'Учебная'),
    ChipWidget(name: 'Ски-парк'),
    ChipWidget(name: 'Ски-кросс'),
    ChipWidget(name: 'Халф-пайп'),
    ChipWidget(name: 'Фри-райд'),
    ChipWidget(name: 'Вечернее катание'),
  ];
  List<Widget> uppersChips = const [
    ChipWidget(name: 'Ленточный'),
    ChipWidget(name: 'Бугельный'),
    ChipWidget(name: 'Кресельный'),
    ChipWidget(name: 'Гондольный/кабинный'),
  ];
  List<Widget> lenghtChips = const [
    ChipWidget(name: 'Короткая'),
    ChipWidget(name: 'Средняя'),
    ChipWidget(name: 'Длинная'),
    ChipWidget(name: 'Очень длинная'),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: screenWidth * 0.19,
                    height: 5,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                        color: CustomColors.grey),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Фильтры',
                      style: CustomStyle.blackBold22,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 20,
                          child: const Text(
                            "Закрыть",
                            style: CustomStyle.blackUnderline13,
                          ),
                        ))
                  ],
                ),
                const Text(
                  'Cезон',
                  style: CustomStyle.blackBold18,
                ),
                Wrap(
                  children: [for (var chip in seasonChips) chip],
                ),
                SizedBox(height: 10),
                const Text(
                  'Регион',
                  style: CustomStyle.blackBold18,
                ),
                Wrap(
                  children: [for (var chip in regionChips) chip],
                ),
                SizedBox(height: 10),
                const Text(
                  'Наличие трасс',
                  style: CustomStyle.blackBold18,
                ),
                Wrap(
                  children: [for (var chip in trackChips) chip],
                ),
                SizedBox(height: 10),
                const Text(
                  'Наличие подъемников',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  children: [for (var chip in uppersChips) chip],
                ),
                SizedBox(height: 10),
                const Text(
                  'Длина трассы',
                  style: CustomStyle.blackBold18,
                ),
                Wrap(
                  children: [for (var chip in lenghtChips) chip],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Прокат снаряжения',
                      style: CustomStyle.blackBold18,
                    ),
                    CupertinoSwitch(
                        activeColor: CustomColors.grey,
                        value: hasHire,
                        onChanged: (value) {
                          setState(() {
                            hasHire = value;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Услуги инструктора/школа',
                      style: CustomStyle.blackBold18,
                    ),
                    CupertinoSwitch(
                        activeColor: Colors.grey,
                        value: hasSchool,
                        onChanged: (value) {
                          setState(() {
                            hasSchool = value;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Проживание у подъемника',
                      style: CustomStyle.blackBold18,
                    ),
                    CupertinoSwitch(
                        activeColor: Colors.grey,
                        value: leaveNear,
                        onChanged: (value) {
                          setState(() {
                            leaveNear = value;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Близко к аэропорту',
                      style: CustomStyle.blackBold18,
                    ),
                    CupertinoSwitch(
                        activeColor: Colors.grey,
                        value: nearToAir,
                        onChanged: (value) {
                          setState(() {
                            nearToAir = value;
                          });
                        })
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: screenWidth * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Применить',
                      style: CustomStyle.blackBold18,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(CustomColors.lightGrey),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
