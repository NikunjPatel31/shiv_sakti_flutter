import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  const InputTextField({Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration:
          BoxDecoration(color: const Color(0xffECECEC), borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black, fontSize: 20),
        decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
      ),
    );
  }
}
