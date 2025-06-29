part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
sealed class HomeActionState extends HomeState{}
final class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState{}
class HomeLoadedSuccessSate extends  HomeState{}
class HomeErrorSate extends  HomeState{}
class HomeNavigatetoWishlistPageActionState extends HomeActionState{}
class HomeNavigateToCartPageActionState extends HomeActionState{}