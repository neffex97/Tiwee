import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:Tiwee/business_logic/provider/country_code.dart';
import 'package:Tiwee/business_logic/provider/country_provider.dart';
import 'package:Tiwee/core/consts.dart';
import 'package:Tiwee/presentation/screens/home/player.dart';
import 'package:Tiwee/presentation/widgets/main_appbar.dart';
import 'package:Tiwee/presentation/widgets/tv_card.dart';

//
// final clickedStarProvider = StateProvider<bool>((ref) {
//   bool value = false;
//   void toggle(){
//     value =!value;
//   }
//   return value;
// });



class CountryChannels extends ConsumerWidget {
  const CountryChannels({Key? key, required this.country}) : super(key: key);
  final String country;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final channels = ref.watch(countryProvider);


    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
           MainAppbar(widget: Text(country,style: TextStyle(color: Colors.white70),)),
          channels.when(
            data: (data) => Expanded(
              child: Container(
                  child: GridView.count(
                crossAxisCount: 4,

                children: List.generate(data[country]!.length, (index) {
                  return GestureDetector(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Player(url: data[country]![index].url),)),child: TvCard(size: size, index: index, data: data, ref: ref, country: country));
                }),
              )),
            ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () =>  SizedBox(
                width: 50, child: Lottie.asset(kLoading, width: 60)),
          ),
        ],
      )),
    );
  }
}



