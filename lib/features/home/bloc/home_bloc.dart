import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_master_app/data/cart_items.dart';
import 'package:bloc_master_app/data/grocery_data.dart';
import 'package:bloc_master_app/data/wishlist_items.dart';
import 'package:bloc_master_app/features/home/models/home_product_data.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigationEvent>(homeWishlistButtonNavigationEvent);

    on<HomeProductWishlistButtonClickedEvent>(
      homeProductWishlistButtonClickedEvent,
    );

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigationEvent>(homeCartButtonNavigationEvent);
  }
  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessSate(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'] as String,
                name: e['name'] as String,
                description: e['description'] as String,
                price: (e['price'] as num).toDouble(),
                impageUrl: e['imageUrl'] as String,
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    debugPrint('Wishlist Print');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartAddedActionState());
    debugPrint('Cart Print');
  }

  FutureOr<void> homeWishlistButtonNavigationEvent(
    HomeWishlistButtonNavigationEvent event,
    Emitter<HomeState> emit,
  ) {
    debugPrint(" wishlist Navigation print");
    emit(HomeNavigatetoWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigationEvent(
    HomeCartButtonNavigationEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeNavigateToCartPageActionState());
    debugPrint(" cart Navigation print");
  }
}
