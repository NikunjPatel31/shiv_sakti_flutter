import 'package:flutter/material.dart';

class CategoryItemLayout extends StatelessWidget {
  final String? title;
  const CategoryItemLayout({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 18,
          )
        ],
      ),
    );
  }
}
