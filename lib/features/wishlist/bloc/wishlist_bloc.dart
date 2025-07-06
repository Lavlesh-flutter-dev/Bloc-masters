import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_master_app/data/wishlist_items.dart';
import 'package:bloc_master_app/features/home/models/home_product_data.dart';
import 'package:meta/meta.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveEvent>(wishlistRemoveEvent);
  }

  FutureOr<void> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit(WishlistSuccessState(wishlitItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveEvent(
    WishlistRemoveEvent event,
    Emitter<WishlistState> emit,
  ) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistSuccessState(wishlitItems: wishlistItems));
  }
}
