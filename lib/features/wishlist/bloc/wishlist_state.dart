part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishListActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishListSuccessState extends WishlistState {
  final List<ProductDataModel> wishList;

  WishListSuccessState({required this.wishList});
}
