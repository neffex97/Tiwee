import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:Tiwee/core/consts.dart';
import 'package:lottie/lottie.dart';

class Player extends StatelessWidget {
  Player({Key? key, required this.url}) : super(key: key);
  final String url;

  var betterPlayerConfiguration = BetterPlayerConfiguration(
    controlsConfiguration: BetterPlayerControlsConfiguration(
      textColor: Colors.white,
      iconsColor: Colors.white,
      enableFullscreen: false,
      loadingWidget: SizedBox(
          width: 100,
          child: Lottie.asset(
            kTvLoading,
            width: 60,
            repeat: true,
            reverse: true,
          )),
      showControlsOnInitialize: true,
      showControls: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: SafeArea(
        child: BetterPlayer.network(url,
            betterPlayerConfiguration: betterPlayerConfiguration),
      ),
    );
  }
}
