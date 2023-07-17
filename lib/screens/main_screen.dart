import 'package:flutter/material.dart';
import 'package:velvet/static/custom_icons_icons.dart';
import 'package:velvet/widgets/resort_card_widget.dart';
import '../filter_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeigth = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth * 0.6,
                child: TabBar(
                  indicatorColor: Colors.black,
                  overlayColor: MaterialStateProperty.all(Colors.white),
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: TextStyle(fontSize: 18),
                  tabs: const [
                    Tab(
                      text: 'Курорты',
                    ),
                    Tab(
                      text: 'Карта',
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                                child: Container(
                                    height: screenHeigth * 0.97,
                                    child: const FilterWidget()),
                              );
                            });
                      },
                      icon: const Icon(Icons.settings))
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ResortCardWidget(
                    name: 'Абзаково',
                    range: '240',
                    src:
                        'https://ski-atlas.ru/wp-content/uploads/2019/08/abzakovo11.jpg',
                    tags: const [
                      'Вечернее катание',
                      'Ски-кросс',
                      'Халф-пайп',
                    ],
                    isFavorite: true,
                    iconsRight: [CustomIcons.bus, CustomIcons.group_2_],
                    iconsLeft: [CustomIcons.vector, CustomIcons.group_3],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ResortCardWidget(
                    name: 'Красная поляна',
                    range: '2240',
                    src:
                        'https://kubnews.ru/upload/iblock/593/593760d51c3466994d59a78f4c7c0ede.jpg',
                    tags: const [
                      'Вечернее катание',
                      'Ски-кросс',
                      'Халф-пайп',
                      'Длинная',
                      'Среднаяя',
                      'Вечернее катание',
                      'Ски-кросс',
                      'Халф-пайп',
                      'Длинная',
                      'Среднаяя',
                      'Вечернее катание',
                      'Ски-кросс',
                      'Халф-пайп',
                      'Длинная',
                      'Среднаяя',
                      'Очень длинная'
                    ],
                    isFavorite: false,
                    iconsRight: [CustomIcons.bus, CustomIcons.group_2_],
                    iconsLeft: const [
                      CustomIcons.snow,
                      CustomIcons.crossup,
                      CustomIcons.crossup
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ResortCardWidget(
                    name: 'Абзаково',
                    range: '240',
                    src:
                        'https://ski-atlas.ru/wp-content/uploads/2019/08/abzakovo11.jpg',
                    tags: const [
                      'Вечернее катание',
                      'Ски-кросс',
                      'Халф-пайп',
                      'Длинная',
                      'Среднаяя'
                    ],
                    isFavorite: true,
                    iconsRight: [CustomIcons.bus, CustomIcons.group_2_],
                    iconsLeft: [CustomIcons.vector, CustomIcons.group_3],
                  ),
                ),
              ],
            ),
            const Icon(Icons.directions_transit, size: 350),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: initialIndex,
          onTap: (value) {
            setState(() {
              initialIndex = value;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.group_3),
              label: 'Курорт',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.group_3),
              label: 'Курорт',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.group_3),
              label: 'Курорт',
            ),
          ],
        ),
      ),
    );
  }
}
