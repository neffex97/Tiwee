import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Tiwee/core/consts.dart';

class BigCardChannels extends StatelessWidget {
  const BigCardChannels(
      {Key? key,
        required this.size,
        required this.icon,
        required this.text,
        required this.channelsCount,
        required this.index})
      : super(key: key);

  final Size size;
  final String icon;
  final int index;
  final String text;
  final int channelsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
            ),
            SizedBox(
              height: 13,
            ),
            index == 0
                ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1, horizontal: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.red),
                  child: Text(
                    text.split(" ").first,
                    style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text.split(" ")[1],
                  style: TextStyle(fontSize: 23, color: Colors.white),
                )
              ],
            )
                : Text(
              text,
              style: TextStyle(fontSize: 23, color: Colors.white),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: index == 0
                      ? Colors.grey
                      : index == 1
                      ? Colors.amber
                      : Colors.blueAccent,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${channelsCount.toString()} Channels",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
      height: 70,
      width: size.width / 4.3,
      decoration:
      BoxDecoration(color: kGray, borderRadius: BorderRadius.circular(30)),
    );
  }
}