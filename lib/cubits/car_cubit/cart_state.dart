part of './cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
 class ItemAddedLoading extends CartState {}
 class DataArrived extends CartState {}
 class NotAuthorized extends CartState {}
 class ItemAddedToCart extends CartState {}
 class ItemDeleted extends CartState {}
