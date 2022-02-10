import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:Tiwee/business_logic/model/channel.dart';
import 'package:Tiwee/core/consts.dart';
import 'package:Tiwee/presentation/screens/home/player.dart';
import 'package:Tiwee/presentation/widgets/tv_card.dart';

class SortedByCategoryPage extends StatefulWidget {
  const SortedByCategoryPage(
      {Key? key, required this.categoryName, required this.channels})
      : super(key: key);

  final String categoryName;
  final List<ChannelObj> channels;

  @override
  State<SortedByCategoryPage> createState() => _SortedByCategoryPageState();
}

class _SortedByCategoryPageState extends State<SortedByCategoryPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print(widget.categoryName);
    print(kCategoryType[widget.categoryName]);
    return SafeArea(
      child: Scaffold(
          body: widget.channels.isEmpty
              ? Center(
                  child: SizedBox(
                      width: size.width / 3,
                      child: Lottie.asset(
                        kNotFound,
                        width: 100,
                      )))
              : Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: AnimatedOpacity(
                          opacity: 0.2,
                          duration: Duration(seconds: 1),
                          child: CachedNetworkImage(
                            imageUrl:
                                kCategoryType[widget.categoryName].toString(),
                            placeholder: (context, url) => Container(),
                            fit: BoxFit.cover,
                            fadeInCurve: Curves.bounceIn,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                              width: 140,
                              height: 140,
                              child: CachedNetworkImage(
                                errorWidget: (context, url, error) => Text(
                                  error.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: size.width / 2.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),

                                placeholder: (context, url) => Center(
                                    child: SizedBox(
                                        width: 50,
                                        child:
                                            Lottie.asset(kLoading, width: 60))),
                                imageUrl: widget.channels[currentIndex].logo,
                                // progressIndicatorBuilder: (context, url, progress) => ProgressIndicator(value: progress.progress,),
                                fit: BoxFit.cover,
                              ),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 3,
                              child: AnimationLimiter(
                                child: CarouselSlider.builder(
                                  itemCount: widget.channels.length,
                                  itemBuilder: (context, index, realIndex) {
                                    print("wrw");

                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 700),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: GestureDetector(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Player(
                                                      url: widget
                                                          .channels[index].url),
                                                )),
                                            child: Container(
                                                width: double.infinity,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    color: index == currentIndex
                                                        ? Colors.black
                                                            .withOpacity(0.6)
                                                        : Colors.black
                                                            .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0,
                                                      vertical: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        widget.channels[index]
                                                            .name,
                                                        style: TextStyle(
                                                            color: index ==
                                                                    currentIndex
                                                                ? Colors.white
                                                                    .withOpacity(
                                                                        0.7)
                                                                : Colors.white
                                                                    .withOpacity(
                                                                        0.3)),
                                                      ),
                                                      Text(
                                                        widget.channels[index]
                                                            .languages[0].name,
                                                        style: TextStyle(
                                                            color: index ==
                                                                    currentIndex
                                                                ? Colors.white
                                                                    .withOpacity(
                                                                        0.7)
                                                                : Colors.white
                                                                    .withOpacity(
                                                                        0.3)),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },
                                    aspectRatio: 1 / 5,
                                    viewportFraction: 0.2,
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
