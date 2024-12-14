import 'package:bloc_tut/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_tut/features/home/bloc/home_bloc.dart';
import 'package:bloc_tut/features/home/models/home_product_data_model.dart';
import 'package:bloc_tut/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishListWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishListWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  State<WishListWidget> createState() => _WishListWidgetState();
}

class _WishListWidgetState extends State<WishListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.productDataModel.imageUrl),
              ),
            ),
            height: 200,
            width: double.maxFinite,
          ),
          Text(widget.productDataModel.name),
          Text(widget.productDataModel.desc),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rs${widget.productDataModel.price}"),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      widget.wishlistBloc.add(WishListRemoveEvent(
                          productDataModel: widget.productDataModel));
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_bag),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
