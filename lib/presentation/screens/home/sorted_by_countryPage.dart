import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:Tiwee/business_logic/provider/categoryprovider.dart';
import 'package:Tiwee/business_logic/provider/country_code.dart';
import 'package:Tiwee/business_logic/provider/country_provider.dart';
import 'package:Tiwee/presentation/screens/home/country_channels.dart';
import 'package:Tiwee/presentation/widgets/main_appbar.dart';
import 'package:Tiwee/presentation/widgets/sorted_by_category_widget/fav_all_card.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class SortedByCountryPage extends ConsumerWidget {
  const SortedByCountryPage({Key? key,required this.allChanellsCount}) : super(key: key);
  final int allChanellsCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(categoryProvider);
    final countryCode = ref.watch(countryCodeProvider.state);
    final countrys = ref.watch(countryProvider);

    final currentIndex = ref.watch(currentIndexProvider.state);

    return category.when(
      data: (data) {
        List countryCode2 = countryCode.state.entries
            .map((entry) => ([entry.key, entry.value]))
            .toList();
        return SafeArea(
          child: Scaffold(
            body: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MainAppbar(
                      widget: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.red),
                            child: const Text(
                              "Live",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Tv",
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Center(
                      child: Container(
                        height: 200,
                        width: double.infinity / 4,
                        child: CarouselSlider.builder(
                          itemCount: countryCode2.length,
                          itemBuilder: (context, index, realIndex) {
                            print(countrys
                                .value![countryCode2[index][0]]!.length
                                .toString());
                            return Transform.scale(
                              scale: index == currentIndex.state ? 1 : 0.7,
                              child: GestureDetector(
                                onTap: () {
                                  print(countryCode2[index][0]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CountryChannels(
                                            country: countryCode2[index][0]),
                                      ));
                                },
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            countryCode2[index][1]
                                                .toUpperCase()
                                                .replaceAllMapped(
                                                    RegExp(r'[A-Z]'),
                                                    (match) => String
                                                        .fromCharCode(match
                                                                .group(0)
                                                                .codeUnitAt(0) +
                                                            127397)),
                                            style: TextStyle(fontSize: 65),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        index == currentIndex.state
                                            ? countryCode2[index][0].toString()
                                            : "",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.2),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        index == currentIndex.state
                                            ? countrys
                                                .value![countryCode2[index][0]]!
                                                .length
                                                .toString()+" channels"
                                            : "",
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      )
                                    ]),
                              ),
                            );
                          },
                          options: CarouselOptions(
                              onPageChanged: (index, reason) =>
                                  currentIndex.state = index,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.17,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              scrollPhysics: const BouncingScrollPhysics()),
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FavAllCard(
                                text: "Fav",
                                icon: FontAwesomeIcons.star,
                                count: 25,
                              ),
                              FavAllCard(
                                text: "All",
                                icon: FontAwesomeIcons.tv,
                                count: allChanellsCount,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 50,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff9969C7),
                                    Color(0xff6A359C).withOpacity(0.6),
                                  ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => CircularProgressIndicator(),
    );
  }
}
