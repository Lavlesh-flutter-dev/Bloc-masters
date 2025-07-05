import 'dart:async';
import 'package:bloc_master_app/data/cart_items.dart';
import 'package:bloc_master_app/features/home/models/home_product_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }
  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
    CartRemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
    // get your cart items
    // check is your product model there in your cart items = true
    //run a funcation to remove that product model from that prodect models
    // emit cart items Remov that state
  }
}
