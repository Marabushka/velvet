import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velvet/static/custom_colors.dart';
import 'package:velvet/static/custom_style.dart';
import 'package:velvet/widgets/resort_desc/info_widget.dart';
import 'package:velvet/widgets/resort_desc/ski_pass_widget.dart';
import 'package:velvet/widgets/resort_desc/tracks_widget.dart';

class ResortDescription extends StatefulWidget {
  final String name;
  final String range;
  final String src;
  const ResortDescription(
      {super.key, required this.name, required this.range, required this.src});

  @override
  State<ResortDescription> createState() => _ResortDescriptionState();
}

class _ResortDescriptionState extends State<ResortDescription>
    with TickerProviderStateMixin {
  late ScrollController _scrollViewController;
  late TabController _tabController;
  bool isExpanded = false;
  CarouselController buttonCarouselController = CarouselController();
  int selecteddIndex = 0;
  int indicatorIndex = 0;
  @override
  void initState() {
    _scrollViewController = ScrollController();
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (context, bool) => [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CarouselSlider(
                      items: [
                        Image.network(
                          widget.src,
                          fit: BoxFit.cover,
                          width: screenWidth,
                          height: 260,
                        ),
                        Image.network(
                          'https://kubnews.ru/upload/iblock/593/593760d51c3466994d59a78f4c7c0ede.jpg',
                          fit: BoxFit.cover,
                          width: screenWidth,
                          height: 260,
                        ),
                        Image.network(
                          widget.src,
                          fit: BoxFit.cover,
                          width: screenWidth,
                          height: 260,
                        ),
                      ],
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        aspectRatio: 2.0,
                        initialPage: 2,
                        onPageChanged: (index, reason) {
                          setState(() {
                            indicatorIndex = index;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: AnimatedSmoothIndicator(
                        activeIndex: indicatorIndex,
                        count: 3,
                        effect: const WormEffect(
                            activeDotColor: Colors.black,
                            dotColor: Colors.white),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: widget.name,
                                  style: CustomStyle.blackBold20,
                                  children: const [
                                TextSpan(
                                    text: "   Сейчас сезон",
                                    style: CustomStyle.grey13),
                              ])),
                          Text('${widget.range} км',
                              style: CustomStyle.black16),
                        ],
                      ),
                      const SizedBox(height: 18),
                      ConstrainedBox(
                          constraints: isExpanded
                              ? BoxConstraints()
                              : BoxConstraints(maxHeight: 52),
                          child: const Text(
                              'Абзаково и Банное — два главных лыжных курорта Южного Урала. Они расположены на склонах хребта Крыктытау на расстоянии 25 км друг от друга и работают по единому ски-пассу.',
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: CustomStyle.black13)),
                      const SizedBox(height: 8),
                      isExpanded
                          ? GestureDetector(
                              child: const Text(
                                'Cкрыть описание',
                                style: CustomStyle.blackUnderline13,
                              ),
                              onTap: () => setState(() => isExpanded = false))
                          : GestureDetector(
                              child: const Text(
                                'Развернуть описание',
                                style: CustomStyle.blackUnderline13,
                              ),
                              onTap: () => setState(() => isExpanded = true)),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColors.lightGrey),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: SizedBox(
                    height: 32,
                    child: TabBar(
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          text: "Трассы",
                        ),
                        Tab(text: "Ски-пасс"),
                        Tab(text: "Инфо"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            TracksWidget(),
            SkiPassWidget(),
            InfoWidget(),
          ],
        ),
      ),
    );
  }
}
