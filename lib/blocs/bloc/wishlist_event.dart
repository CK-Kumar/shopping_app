part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class WishlistStart extends WishlistEvent {
  final Wishlist wishlist;
  const WishlistStart({required this.wishlist});
  @override
  List<Object> get props => [wishlist];
}

class WishlistAdd extends WishlistEvent {
  final Product product;
  const WishlistAdd(this.product);
  @override
  List<Object> get props => [product];
}

class WishlistRemove extends WishlistEvent {
  final Product product;
  const WishlistRemove(this.product);
  @override
  List<Object> get props => [product];
}
