import 'package:flutter/material.dart';

class Item extends StatelessWidget {
   Item(this.path, {super.key});
  String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 31,
        backgroundColor: const Color(0xff9098B1),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Image.network(path),
        ),
      ),
    );
  }
}