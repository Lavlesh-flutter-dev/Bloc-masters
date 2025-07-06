import 'package:bloc_master_app/features/cart/ui/cart.dart';
import 'package:bloc_master_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_master_app/features/home/ui/product_tile_widget.dart';
import 'package:bloc_master_app/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) {
        debugPrint('listen when is called');
        return current is HomeActionState;
      },
      buildWhen: (previous, current) {
        debugPrint('build when is called');
        return current is! HomeActionState;
      },
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        } else if (state is HomeNavigatetoWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Wishlist()),
          );
        } else if (state is HomeProductItemCartAddedState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Cart Item Added')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Wishlist Item Added')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeInitial):
            return Scaffold(body: Center(child: Text('Initialising...')));
          case const (HomeLoadingState):
            debugPrint('home is loading');
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case const (HomeLoadedSuccessSate):
            debugPrint('home is success');
            final successState = state as HomeLoadedSuccessSate;
            return Scaffold(
              appBar: AppBar(
                title: Text('Home'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigationEvent());
                    },
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigationEvent());
                    },
                    icon: Icon(Icons.shop),
                  ),
                ],
              ),
              body: SafeArea(
                child: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      productDataModel: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  },
                ),
              ),
            );
          case const (HomeErrorSate):
            return Scaffold(body: Center(child: Text('Error loading data')));
          default:
            return Scaffold(body: Center(child: Text("Unknown state")));
        }
      },
    );
  }
}
