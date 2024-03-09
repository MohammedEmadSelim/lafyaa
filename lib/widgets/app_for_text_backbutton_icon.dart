import 'package:flutter/material.dart';

class AppBarForIconAndTextAndIcons extends StatelessWidget {
  AppBarForIconAndTextAndIcons(
      {super.key, required this.text, this.icon1, this.icon2});
  final Text text;
  Widget? icon1;
  Widget? icon2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        Expanded(child: text),
        icon1 ?? const SizedBox.shrink(),
        const SizedBox(width: 10),
        icon2 ?? const SizedBox.shrink(),
      ],
    );
  }
}
