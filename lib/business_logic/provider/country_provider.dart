import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Tiwee/business_logic/model/channel.dart';
import 'package:Tiwee/business_logic/provider/channelProvider.dart';
import 'package:Tiwee/business_logic/provider/country_code.dart';
import 'package:Tiwee/core/consts.dart';

final countryProvider =
    Provider<AsyncValue<Map<String, List<ChannelObj>>>>((ref) {
  Map<String, List<ChannelObj>> sortedByCountry = {};

  final channels = ref.watch(mainChannels);
  print("zingerioinoi");

  return channels.when(
    data: (value) {
      int x = 0;
      for (ChannelObj channel in value!) {
        // print(sortedByCategory);

        if (channel.countries.isNotEmpty) {
          x++;

          for (Country element in channel.countries) {
            // print(sortedByCountry.runtimeType);
            // print("gindo");
            // print(element);
            // print(element.name);
            if (element.name != "") {

              // sortedByCountry[element.name]!.add(channel);
              sortedByCountry[element.name]=[...?sortedByCountry[element.name],channel];

            }
          }
        }
      }
      return AsyncValue.data(sortedByCountry);
    },
    error: (error, stackTrace) =>
        AsyncValue.error(error, stackTrace: stackTrace),
    loading: AsyncValue.loading,
  );
});
