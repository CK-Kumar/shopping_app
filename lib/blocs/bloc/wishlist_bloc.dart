// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<WishlistStart>(_onWishlistStart);
    on<WishlistAdd>(_onWishlistAdd);
    on<WishlistRemove>(_onWishlistRemove);
  }

  void _onWishlistStart(WishlistStart event, Emitter<WishlistState> emit) {
    emit(WishlistLoaded(wishlist: event.wishlist));
  }

  void _onWishlistAdd(WishlistAdd event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      emit(WishlistLoaded(
          wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..add(event.product))));
    }
  }

  void _onWishlistRemove(WishlistRemove event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
       state.wishlist.products.removeWhere((item)=>item.id == event.product.id);
       
      emit(WishlistLoaded(wishlist: Wishlist(products: state.wishlist.products)));
    }
  }
}
