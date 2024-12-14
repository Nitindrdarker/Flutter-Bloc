part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent {}

class WishListRemoveEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishListRemoveEvent({required this.productDataModel});
}
