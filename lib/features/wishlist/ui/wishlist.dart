import 'package:bloc_tut/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_tut/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_tut/features/wishlist/ui/wishList_tile.widget.dart';
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
    wishlistBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WishListed Items"),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) {
            return current is WishListActionState;
          },
          buildWhen: (previous, current) {
            return current is! WishListActionState;
          },
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishListSuccessState:
                final successState = state as WishListSuccessState;
                return ListView.builder(
                  itemCount: successState.wishList.length,
                  itemBuilder: (context, index) {
                    return WishListWidget(
                        wishlistBloc: wishlistBloc,
                        productDataModel: successState.wishList[index]);
                  },
                );
            }
            return Container();
          },
        ));
  }
}
