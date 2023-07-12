import 'package:flutter/material.dart';

class Dicee extends StatelessWidget {
  Dicee({super.key, required this.count});

  int count;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Image.asset(
      "assets/images/dice$count.png",
      height: size.width * 0.3,
      width: size.width * 0.3,
    ));
  }
}
