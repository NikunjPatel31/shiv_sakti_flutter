import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icons;
  const CircularButton({Key? key, required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xff37495C),
      ),
      child: Icon(
        icons,
        color: Colors.white,
      ),
    );
  }
}
