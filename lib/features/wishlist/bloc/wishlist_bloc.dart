import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut/data/wishlist_items.dart';
import 'package:bloc_tut/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListRemoveEvent>(wishListRemoveEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishListSuccessState(wishList: wishlistItems));
  }

  FutureOr<void> wishListRemoveEvent(
      WishListRemoveEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishListSuccessState(wishList: wishlistItems));
  }
}
