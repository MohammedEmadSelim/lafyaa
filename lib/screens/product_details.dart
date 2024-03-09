import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/cubits/car_cubit/cart_cubit.dart';
import 'package:task/screens/login_screen.dart';
import 'package:task/widgets/app_for_text_backbutton_icon.dart';
import 'package:task/widgets/rank_star_view.dart';
import 'package:task/widgets/slide_bar.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});
  late int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is NotAuthorized) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('not authorized')));
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        }
        if(state is ItemAddedToCart){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item added successfuly')));
        }
        if(state is ItemDeleted){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item deleted')));
        }
      },
      child: Scaffold(
        body: ListView(
          children: [
            AppBarForIconAndTextAndIcons(
              text: const Text(
                'Nike Air Max 270 Rea...',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              icon1: InkWell(
                child: Image.asset('assets/images/Group.png'),
                onTap: () {},
              ),
              icon2: InkWell(
                child: Image.asset('assets/images/More.png'),
                onTap: () {},
              ),
            ),
            const SlideBar(
              viewList: [1, 2, 3, 4, 5, 6, 7, 8],
              imagUrl: 'assets/images/Product Image.png',
              autoPlay: false,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Nike Air Zoom Pegasus 36 Miami ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      InkWell(
                        onTap: () => print('product Detail Screen heart'),
                        child: Image.asset('assets/images/love.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const RankStarView(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    '\$64,43',
                    style: TextStyle(
                      color: Color(0xff40BFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Select Size',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          print('on tap select size' + index.toString());
                        },
                        child: CircleAvatar(
                          radius: 48,
                          backgroundColor: const Color(0xffEBF0FF),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xffFFFFFF),
                            radius: 37.5,
                            child: Text(
                              (index + 6).toString(),
                              style: const TextStyle(color: Color(0xff223263)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state is ItemAddedLoading) {
                        return const CircularProgressIndicator();
                      }

                      return ElevatedButton(
                        onPressed: () async{
                          final SharedPreferences pref = await SharedPreferences.getInstance();
                          final token = pref.getString('token');
                          print(token);
                          context.read<CartCubit>().addToCart(52,token );
                        },
                        child: const Text('Add to cart'),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


