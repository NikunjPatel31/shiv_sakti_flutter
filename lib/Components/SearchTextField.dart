import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration:
          BoxDecoration(color: const Color(0xff37495C), borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Row(
        children: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            style: TextStyle(color: Colors.white, fontSize: 19),
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ))
        ],
      ),
    );
  }
}
