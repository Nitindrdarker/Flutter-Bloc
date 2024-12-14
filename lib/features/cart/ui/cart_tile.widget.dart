import 'package:bloc_tut/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_tut/features/home/bloc/home_bloc.dart';
import 'package:bloc_tut/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  State<CartTileWidget> createState() => _CartTileWidgetState();
}

class _CartTileWidgetState extends State<CartTileWidget> {
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
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.cartBloc.add(CartRemoveFromCartEvent(
                          productDataModel: widget.productDataModel));
                    },
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
