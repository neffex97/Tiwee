import 'package:flutter/material.dart';

class ShowSnackBar {
  ShowSnackBar({required this.context, required this.text});

  final BuildContext context;
  final String text;
  void show(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(text)));
  }
}
