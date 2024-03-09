import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/carousel_cubit/carousel_cubit.dart';

class SlideBar extends StatelessWidget {
  const SlideBar({
    super.key,
    required this.viewList,
    required this.imagUrl,
    required this.autoPlay,
  });

  final List viewList;
  final String imagUrl;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          BlocBuilder<CarouselCubit, CcarouselState>(
            builder: (context, state) {
              return CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    context.read<CarouselCubit>().runIndex(index);
                  },
                  // height: 343.0,
                  autoPlay: autoPlay,
                  viewportFraction: .96,
                  autoPlayCurve: Curves.bounceInOut,
                ),
                items: viewList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: 206,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          imagUrl,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          // the circles under slide show
          BlocBuilder<CarouselCubit, CcarouselState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  viewList.length,
                  (index) => SizedBox(
                    child: Icon(
                      size: 8,
                      Icons.circle,
                      color:
                          context.read<CarouselCubit>().indexForCircls == index
                              ? const Color(0xff40BFFF)
                              : const Color(0xffEBF0FF),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
