part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessSate extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessSate({required this.products});
}

class HomeErrorSate extends HomeState {}

class HomeNavigatetoWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {
  // final ProductDataModel productDataModel;
  // HomeProductItemWishlistedActionState({required this.productDataModel});
}

class HomeProductItemCartAddedActionState extends HomeActionState {
  // final ProductDataModel productDataModel;
  // HomeProductItemCartAddedActionState({required this.productDataModel});
}
