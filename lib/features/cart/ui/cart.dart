import 'package:bloc_master_app/features/cart/ui/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  final CartBloc cartBloc = CartBloc();
  initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cart')),

      body: BlocConsumer(
        builder: (context, state) {
         switch (state.runtimeType){
          case CartSuccessState:
          final successState = state as CartSuccessState;
          return ListView.builder(
            
            itemBuilder: (context, index) {
            final product = successState.cartItems[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () {
                  cartBloc.add(CartRemoveFromCartEvent(product));
                },
              ),
            );
          }, itemCount: successState.cartItems.length,);
         }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
         
        },
      ),
    );
  }
}
