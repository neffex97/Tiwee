import 'package:flutter/material.dart';
import 'package:Tiwee/core/consts.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({Key? key,required this.function, required this.child}) : super(key: key);
  final Widget child;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        function();
      },
      child: Container(
          decoration: BoxDecoration(
              color: kGray, borderRadius: BorderRadius.circular(20)),
          child: child),
    );
  }
}