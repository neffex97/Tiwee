import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:Tiwee/business_logic/utils/show_snackbar.dart';
import 'package:Tiwee/core/consts.dart';
import 'package:Tiwee/presentation/widgets/main_appbar.dart';
import 'package:Tiwee/presentation/widgets/setting/setting_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  void openTelegram()async{

    if (!await launch("https://telegram.me/NatureSmiling")) throw 'Could not launch telegram';

  }
  void openGithub()async{

    if (!await launch("https://github.com/NatureSmiling")) throw 'Could not launch github';

  }

  @override
  Widget build(BuildContext context) {
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
                    child: StaggeredGrid.count(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 3,
                  children: [
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: SettingCard(
                          function: ShowSnackBar(context: context,text: "Coming sooooon :)").show,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/saved.svg",
                                color: Colors.white70,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Saved show",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              )
                            ],
                          ),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: SettingCard(
                          function: ShowSnackBar(context: context,text: "Coming sooooon :)").show,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(LineIcons.sun,size: 50,color: Colors.white70,),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Toggle theme",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              )
                            ],
                          ),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: SettingCard(
                          function: ShowSnackBar(context: context,text: "Coming sooooon :)").show,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/alarm.svg",
                                color: Colors.white70,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Set alarm",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              )
                            ],
                          ),
                        )),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: SettingCard(
                        function: openTelegram,
                        child: LineIcon.telegram(
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: SettingCard(
                        function: openGithub,
                        child: LineIcon.github(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 4,
                      child: SettingCard(
                        function: ShowSnackBar(context: context,text: "No update available yet... :)").show,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Check for update",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 18),
                            ),
                            SvgPicture.asset(
                              "assets/icons/update.svg",
                              color: Colors.green,
                              width: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 6,
                        mainAxisCellCount: 3,
                        child: SettingCard(
                          function: ShowSnackBar(context: context,text: "Coming sooooooon :)").show,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/parent_lock.svg",
                                color: Colors.white70,
                                width: 38,
                              ),
                            const  SizedBox(
                                height: 25,
                              ),
                              RichText(
                                text:const TextSpan(
                                    text: "Parental\n",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Control",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )),
                  ],
                )),
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


