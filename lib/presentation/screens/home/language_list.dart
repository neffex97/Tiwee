import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Tiwee/business_logic/model/channel.dart';
import 'package:Tiwee/core/consts.dart';
import 'package:Tiwee/presentation/screens/home/player.dart';
import 'package:lottie/lottie.dart';
class LanguageList extends StatelessWidget {
  const LanguageList({Key? key, required this.channels}) : super(key: key);
  final List<ChannelObj> channels;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(body:channels.isEmpty?Center(
      child: Lottie.asset(kNotFound,
          width: width / 2),
    ):ListView.builder(
      itemCount: channels.length,
      itemBuilder:
            (BuildContext context, int index) {
          return SizedBox(

            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Player(url:channels[index].url),)),
                child: Card(
                  child: ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: CachedNetworkImage(
                          errorWidget: (context, url, error) => Icon(Icons.warning,color: Colors.amber),
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                              child: SizedBox(
                                  width: 30,
                                  child: Lottie.asset(kLoading, width: 30))),
                          imageUrl: channels[index].logo),
                    ),
                    title: Text(channels[index].name,),


                  ),
                ),
              ),
            ),
          );
        },

    )
    );
  }
}
