import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task/Repository/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addToCart(int productId, String? token) async {
    emit(ItemAddedLoading());
    final Response<dynamic> ?res = await AddToCartRepo().postItem(productId,token);
    final status = res!.data['status'] as bool;
    final message = res.data['message'] as String;
    if(message =='Added Successfully'){
      emit(ItemAddedToCart());
    }
    if (status) {
      emit(ItemDeleted());
    } else if (message == 'غير مصرح لك') {
      emit(NotAuthorized());
    }

  }
}
