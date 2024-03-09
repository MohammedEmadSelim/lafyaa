import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:task/style/colors.dart';

class ShimmerCircleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  10.0),
      child: SizedBox(
        width: 65.0,
        height: 65.0,
        child: Shimmer.fromColors(
          baseColor: shimmerColor!,
          highlightColor: Colors.transparent,
          child: CircleAvatar(
            backgroundColor: shimmerColor,
          ),
        ),
      ),
    );
  }
}
