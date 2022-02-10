import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Tiwee/business_logic/model/channel.dart';
import 'package:Tiwee/business_logic/provider/channelProvider.dart';
import 'package:Tiwee/business_logic/provider/country_code.dart';
import 'package:Tiwee/core/consts.dart';

import 'channelCardprovider.dart';

final categoryProvider =
    Provider<AsyncValue<Map<String, List<ChannelObj>>>>((ref) {
  Map<String, List<ChannelObj>> sortedByCategory = {};
  kCategoryType.forEach((key, value) {
    sortedByCategory[key] = [];
  });

  final channels = ref.watch(mainChannels);
  final categoriesChannels = ref.watch(channelCardProvider.state);
  final countryCode = ref.watch(countryCodeProvider.state);

  return channels.when(
    data: (value) {
      int x = 0;
      for (ChannelObj channel in value!) {
        // print(sortedByCategory);

        if (channel.categories.isNotEmpty) {
          // countryCode.state.contains(channel.countries[0].name
          if (channel.countries.isNotEmpty) {
            if (countryCode.state.isNotEmpty) {
              for (var element in channel.countries) {
                bool containCountry =
                    countryCode.state.keys.contains(element.name);
                if (!containCountry) {
                  countryCode.state[element.name] = element.code;
                } else {
                  countryCode.state[element.name] = element.code;
                }
              }
            } else {
              countryCode.state[channel.countries[0].name] =
                  channel.countries[0].code;
            }
          }

          x++;

          switch (channel.categories[0].name) {
            case "Animation":
              categoriesChannels.state.forEach((element) =>
                  element.name == "Animation" ? element.channelCount++ : null);
              sortedByCategory["Animation"]!.add(channel);

              break;
            case "Business":
              for (var element in categoriesChannels.state) {
                element.name == "Business" ? element.channelCount++ : null;
              }

              sortedByCategory["Business"]!.add(channel);
              break;

            case "Comedy":
              for (var element in categoriesChannels.state) {
                element.name == "Comedy" ? element.channelCount++ : null;
              }

              sortedByCategory["Comedy"]!.add(channel);

              break;
            case "Cooking":
              for (var element in categoriesChannels.state) {
                element.name == "Cooking" ? element.channelCount++ : null;
              }

              sortedByCategory["Cooking"]!.add(channel);

              break;

            case "Education":
              for (var element in categoriesChannels.state) {
                element.name == "Education" ? element.channelCount++ : null;
              }
              sortedByCategory["Education"]!.add(channel);

              break;
            case "Entertainment":
              for (var element in categoriesChannels.state) {
                element.name == "Entertainment" ? element.channelCount++ : null;
              }

              sortedByCategory["Entertainment"]!.add(channel);

              break;

            case "Family":
              for (var element in categoriesChannels.state) {
                element.name == "Family" ? element.channelCount++ : null;
              }

              sortedByCategory["Family"]!.add(channel);

              break;

            case "Kids":
              for (var element in categoriesChannels.state) {
                element.name == "Kids" ? element.channelCount++ : null;
              }
              sortedByCategory["Kids"]!.add(channel);

              break;

            case "Lifestyle":
              sortedByCategory["Lifestyle"]!.add(channel);

              break;

            case "Local":
              sortedByCategory["Local"]!.add(channel);

              break;
            case "Movies":
              for (var element in categoriesChannels.state) {
                element.name == "Movies" ? element.channelCount++ : null;
              }

              sortedByCategory["Movies"]!.add(channel);

              break;
            case "Music":
              for (var element in categoriesChannels.state) {
                element.name == "Music" ? element.channelCount++ : null;
              }

              sortedByCategory["Music"]!.add(channel);

              break;
            case "News":
              for (var element in categoriesChannels.state) {
                element.name == "News" ? element.channelCount++ : null;
              }

              sortedByCategory["News"]!.add(channel);

              break;

            case "Relax":
              sortedByCategory["Relax"]!.add(channel);

              break;
            case "Religious":
              for (var element in categoriesChannels.state) {
                element.name == "Religious" ? element.channelCount++ : null;
              }

              sortedByCategory["Religious"]!.add(channel);

              break;
            case "Science":
              for (var element in categoriesChannels.state) {
                element.name == "Science" ? element.channelCount++ : null;
              }

              sortedByCategory["Science"]!.add(channel);

              break;
            case "Series":
              for (var element in categoriesChannels.state) {
                element.name == "Series" ? element.channelCount++ : null;
              }

              sortedByCategory["Series"]!.add(channel);

              break;
            case "Shop":
              sortedByCategory["Shop"]!.add(channel);
              for (var element in categoriesChannels.state) {
                element.name == "Shop" ? element.channelCount++ : null;
              }

              break;

            case "Sports":
              categoriesChannels.state.forEach((element) =>
                  element.name == "Sports" ? element.channelCount++ : null);

              sortedByCategory["Sports"]!.add(channel);

              break;

            case "Travel":
              sortedByCategory["Travel"]!.add(channel);

              break;
            case "Weather":
              sortedByCategory["Weather"]!.add(channel);

              break;

            case "Auto":
              categoriesChannels.state.forEach((element) =>
                  element.name == "Auto" ? element.channelCount++ : null);

              sortedByCategory["Auto"]!.add(channel);
              break;

            default:
              sortedByCategory["Other"]!.add(channel);
          }
        }
      }
      for (var element in categoriesChannels.state) {
        element.name == "Live Tv" ? element.channelCount = x : null;
      }
      print("eneee");
      print(countryCode.state);

      return AsyncValue.data(sortedByCategory);
    },
    error: (error, stackTrace) =>
        AsyncValue.error(error, stackTrace: stackTrace),
    loading: AsyncValue.loading,
  );
});
