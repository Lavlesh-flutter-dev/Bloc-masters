import 'package:bloc_master_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_master_app/features/home/models/home_product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  ProductTileWidget({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    productDataModel.impageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Text(
                productDataModel.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                productDataModel.description,
                style: TextStyle(fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    '\$${productDataModel.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle wishlist button click
                          homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                          debugPrint(
                            'Wishlist button clicked for ${productDataModel.name}',
                          );
                        },
                        icon: Icon(Icons.favorite_border),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle cart button click
                          homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                          debugPrint(
                            'Cart button clicked for ${productDataModel.name}',
                          );
                        },
                        icon: Icon(Icons.add_shopping_cart),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
