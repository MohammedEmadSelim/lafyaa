import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/Repository/category_repo.dart';
import 'package:task/widgets/item.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Category',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff223263)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More Category',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff40BFFF)),
                ),
              )
            ],
          ),
          FutureBuilder(
              future: CategoryRepo().getCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.transparent,
                    child: SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const CircleAvatar();
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 7,
                          );
                        },
                        itemCount: 7,
                      ),
                    ),
                  );
                }

                if (snapshot.hasData) {
                  return Container(
                    //TO DO
                    height: 100,
                    child: ListView.builder(
                      itemCount: snapshot.data!.data.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        var data = snapshot.data;
                        return Column(children: [
                          Item(data!.data.data[index].image),
                          Text(
                            snapshot.data!.data.data[index].name,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9098B1),
                            ),
                          ),
                        ]);
                      },
                    ),
                  );
                }
                return Text('watting');
              }),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
