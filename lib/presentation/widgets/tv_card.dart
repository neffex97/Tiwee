import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:Tiwee/core/consts.dart';
import 'package:Tiwee/presentation/screens/home/country_channels.dart';

class TvCard extends StatelessWidget {
  const TvCard(
      {Key? key,
        required this.size,
        required this.index,
        required this.data,
        required this.ref,
        required this.country})
      : super(key: key);
  final size;
  final int index;
  final WidgetRef ref;
  final String country;
  final data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              errorWidget: (context, url, error) => Text(
                error.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              imageBuilder: (context, imageProvider) => Container(
                height: size.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image:
                  DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),

              placeholder: (context, url) => Center(
                  child: SizedBox(
                      width: 50, child: Lottie.asset(kLoading, width: 60))),
              imageUrl: data[country]![index].logo,


              // progressIndicatorBuilder: (context, url, progress) => ProgressIndicator(value: progress.progress,),
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Text(
                data[country]![index].name,
                overflow: TextOverflow.ellipsis,
                style:
                const TextStyle(color: Colors.white, fontSize: 12),
              ),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
            ),
          ],
        ));
  }
}