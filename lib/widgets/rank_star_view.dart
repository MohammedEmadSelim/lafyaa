import 'package:flutter/material.dart';

class RankStarView extends StatelessWidget {
  const RankStarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index >= 4) {
            return Image.asset('assets/images/S05tar.png');
          }
          return Image.asset('assets/images/S04tar.png');
        },
        itemCount: 5,
      ),
    );
  }
}
