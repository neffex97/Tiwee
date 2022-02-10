import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:Tiwee/business_logic/provider/categoryprovider.dart';
import 'package:Tiwee/business_logic/provider/channelCardprovider.dart';
import 'package:Tiwee/core/consts.dart';
import 'package:Tiwee/presentation/screens/home/home_page.dart';

import 'package:Tiwee/presentation/screens/home/sorted_by_category_page.dart';
import 'package:Tiwee/presentation/screens/home/sorted_by_countryPage.dart';
import 'package:Tiwee/presentation/widgets/home_page_widget/big_card_channel.dart';
import 'package:Tiwee/presentation/widgets/main_appbar.dart';

class Menu extends ConsumerWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelCard = ref.watch(channelCardProvider.state);

    final categories = ref.watch(categoryProvider);

    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kBlackBg, kWhiteBg],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Column(
              children: [
                MainAppbar(
                  havSettingBtn: true,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.jm().format(DateTime.now()),
                        style: const TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Colors.white70,
                            fontSize: 15),
                      ),
                      Text(
                        DateFormat.yMMMd().format(DateTime.now()),
                        style: const TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Colors.grey,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: categories.when(
                    data: (data) => AnimationLimiter(
                        child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: channelCard.state.length,
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 900),
                              child: SlideAnimation(
                                child: FadeInAnimation(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => index == 0
                                                  ? SortedByCountryPage(allChanellsCount:channelCard
                                                  .state[index].channelCount ,)
                                                  : SortedByCategoryPage(
                                                      categoryName: channelCard
                                                          .state[index].name,
                                                      channels: data[channelCard
                                                          .state[index].name]??[],
                                                    ),
                                            )),
                                        child: BigCardChannels(
                                          index: index,
                                          size: size,
                                          channelsCount: channelCard
                                              .state[index].channelCount,
                                          icon: channelCard
                                              .state[index].iconAddress,
                                          text: channelCard.state[index].name,
                                        ),
                                      )),
                                ),
                              )),
                    )),
                    error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    loading: () =>
                        Lottie.asset(kLoading, width: size.width / 4),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
