import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Tiwee/business_logic/model/channel_model.dart';

final channelCardProvider = StateProvider<List<ChannelModel>>((ref) {
  List<ChannelModel> channelsCard = [
    ChannelModel(
        name: "Live Tv", iconAddress: "assets/icons/tv.svg", channelCount: 0),
    ChannelModel(
        name: "Movies",
        iconAddress: "assets/icons/popcorn.svg",
        channelCount: 0),
    ChannelModel(
        name: "Series", iconAddress: "assets/icons/movie.svg", channelCount: 0),
    ChannelModel(
        name: "Animation",
        iconAddress: "assets/icons/animation.svg",
        channelCount: 0),
    ChannelModel(
        name: "Music", iconAddress: "assets/icons/music.svg", channelCount: 0),
    ChannelModel(
        name: "Auto", iconAddress: "assets/icons/auto.svg", channelCount: 0),
    ChannelModel(
        name: "Sport", iconAddress: "assets/icons/sport.svg", channelCount: 0),
    ChannelModel(
        name: "News", iconAddress: "assets/icons/news.svg", channelCount: 0),
    ChannelModel(
        name: "Coocking",
        iconAddress: "assets/icons/coocking.svg",
        channelCount: 0),
    ChannelModel(
        name: "Kids", iconAddress: "assets/icons/kids.svg", channelCount: 0),
    ChannelModel(
        name: "Education",
        iconAddress: "assets/icons/education.svg",
        channelCount: 0),
    ChannelModel(
        name: "Business",
        iconAddress: "assets/icons/business.svg",
        channelCount: 0),
    ChannelModel(
        name: "Relaxation",
        iconAddress: "assets/icons/relaxation.svg",
        channelCount: 0),
    ChannelModel(
        name: "Entertainment",
        iconAddress: "assets/icons/entertainment.svg",
        channelCount: 0),
    ChannelModel(
        name: "LifeStyle",
        iconAddress: "assets/icons/lifeStyle.svg",
        channelCount: 0),
    ChannelModel(
        name: "Science",
        iconAddress: "assets/icons/science.svg",
        channelCount: 0),
    ChannelModel(
        name: "Comedy",
        iconAddress: "assets/icons/comedy.svg",
        channelCount: 0),
    ChannelModel(
        name: "Family",
        iconAddress: "assets/icons/family.svg",
        channelCount: 0),
    ChannelModel(
        name: "Shop", iconAddress: "assets/icons/shop.svg", channelCount: 0),

  ];
  return channelsCard;
});
