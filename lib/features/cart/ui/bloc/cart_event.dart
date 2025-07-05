part of 'cart_bloc.dart';

sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;
  CartRemoveFromCartEvent({required this.productDataModel});
}
