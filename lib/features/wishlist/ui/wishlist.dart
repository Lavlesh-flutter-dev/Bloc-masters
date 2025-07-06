import 'package:bloc_master_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_master_app/features/wishlist/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist')),
      body: BlocConsumer(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (WishlistSuccessState):
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlitItems.length,
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                    productDataModel: successState.wishlitItems[index],
                    wishlistBloc: wishlistBloc,
                  );
                },
              );
          }
          return Container(color: Colors.red);
        },
      ),
    );
  }
}
