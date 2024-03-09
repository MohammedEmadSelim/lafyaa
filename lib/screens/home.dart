import 'package:flutter/material.dart';
import 'package:task/Repository/category_repo.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task/style/colors.dart';
import 'package:task/widgets/circle_shimmer.dart';
import 'package:task/widgets/rank_star_view.dart';
import 'package:task/widgets/slide_bar.dart';
import '../widgets/item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> viewList = [
    {
      'image': 'assets/images/shirt.png',
      'name': 'Shirt',
    },
    {
      'image': 'assets/images/dress.png',
      'name': 'Dress',
    },
    {
      'image': 'assets/images/man_bag.png',
      'name': 'Man Bag',
    },
    {
      'image': 'assets/images/woman_bag.png',
      'name': 'Woman Bag',
    },
    {
      'image': 'assets/images/shirt.png',
      'name': 'Shirt',
    },
    {
      'image': 'assets/images/woman_bag.png',
      'name': 'Woman Bag',
    },
    {
      'image': 'assets/images/shirt.png',
      'name': 'Shirt',
    },
  ];
  int indexForCircls = 0;
  List<Widget> list = [
    home1(),
    const Search(),
    const Person(),
    const Shoping(),
    const Favoritte(),
  ];
  int currentBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: list[currentBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentBarIndex = value;
          setState(() {});
        },
        currentIndex: currentBarIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'SHoping'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_outlined), label: 'Favorite'),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class home1 extends StatelessWidget {
  List<dynamic> viewList = [
    {
      'image': 'assets/images/shirt.png',
      'name': 'Shirt',
    },
    {
      'image': 'assets/images/dress.png',
      'name': 'Dress',
    },
    {
      'image': 'assets/images/man_bag.png',
      'name': 'Man Bag',
    },
    {
      'image': 'assets/images/woman_bag.png',
      'name': 'Woman Bag',
    },
    {
      'image': 'assets/images/shirt.png',
      'name': 'Shirt',
    },
    {
      'image': 'assets/images/woman_bag.png',
      'name': 'Woman Bag',
    },
    {
      'image': 'assets/images/shirt.png',
      'name': 'Shirt',
    },
  ];
  int indexForCircls = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children: [
              //Search Bar Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: 263,
                      height: 46,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: ImageIcon(
                            AssetImage('assets/images/Search.png'),
                            size: 16,
                            color: Color(0xff40BFFF),
                          ),
                          hintText: ('Search Product'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffEBF0FF),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffEBF0FF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/love.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/Notification.png',
                        width: 24,
                        height: 24,
                      )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
      
              // Slider  Sction Carousel
              SlideBar(viewList: viewList, imagUrl: 'assets/images/Promotion.png', autoPlay: true,),
      
              const Divider(),
              const SizedBox(
                height: 16,
              ),
      
              // Category Row + FutureBuilder + sizedBox
              Column(
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
                          return SizedBox(
                            height: 70,
                            child: Center(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) =>
                                    ShimmerCircleWidget(),
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
                        return const Text('watting');
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
      
              const SizedBox(
                height: 24,
              ),
      
              // row of  Flash Sale text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Flash Sale',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff223263)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See More',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff40BFFF)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
      
              // row of  Flash Sale products
      
              Container(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: borderCardColor!)),
                      padding: const EdgeInsets.all(16),
                      width: 141,
                      height: 238,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/imageProduct.png'),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'FS - Nike Air Max 270 React...',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff223263)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          //discounded price
                          const Text(
                            '\$299,43',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff40BFFF)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          //the text has line in middle horizontal
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Text(
                                    '\$534,33',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff9098B1),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    left: 0,
                                    child: Divider(
                                      color: Color(0xff9098B1),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '24% Off',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFB7181)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
      
              const SizedBox(
                height: 24,
              ),
      
              // // Row of Mega Sale Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Mega Sale ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff223263)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See More',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff40BFFF)),
                    ),
                  )
                ],
              ),
              // // List of Mega Saleproduct
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: borderCardColor!)),
                      padding: const EdgeInsets.all(16),
                      width: 141,
                      height: 238,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/imageProduct2.png'),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'FS - Nike Air Max 270 React...',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff223263)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          //discounded price
                          const Text(
                            '\$299,43',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff40BFFF)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          //the text has line in middle horizontal
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Text(
                                    '\$534,33',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff9098B1),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    left: 0,
                                    child: Divider(
                                      color: Color(0xff9098B1),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '24% Off',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFB7181)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
      
              const SizedBox(
                height: 9,
              ),
              // recommened image
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/image51.png',
                      height: 206,
                      width: 343,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 160,
                        child: const Text(
                          'Recomended Product',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'We recommend the best for you',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      
              const SizedBox(
                height: 16,
              ),
      
              //grid view of products
              Container(
                height: 640,
                child: AlignedGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 12,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: borderCardColor!,
                        ),
                      ),
                      height: 300,
                      width: 165,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/imageProduct.png',
                            height: 133,
                            width: 133,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'FS - Nike Air Max 270 React...',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff223263)),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
      
                          const RankStarView(),
                        
                          const SizedBox(
                            height: 16,
                          ),
                          //discounded price
                          const Text(
                            '\$299,43',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff40BFFF)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          //the text has line in middle horizontal
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Text(
                                    '\$534,33',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff9098B1),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    left: 0,
                                    child: Divider(
                                      color: Color(0xff9098B1),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '24% Off',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFB7181)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // ==============================================================================================================================
            ],
          ),
        ),
      ),
    );
  }
}



class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text('search'),
        )
      ],
    );
  }
}

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text('Person'),
        )
      ],
    );
  }
}

class Shoping extends StatelessWidget {
  const Shoping({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text('Shoping'),
        )
      ],
    );
  }
}

class Favoritte extends StatelessWidget {
  const Favoritte({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text('favorte'),
        )
      ],
    );
  }
}
