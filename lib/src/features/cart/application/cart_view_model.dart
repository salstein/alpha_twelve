import 'package:alpha_twelve/src/features/cart/models/cart_object_dto.dart';
import 'package:alpha_twelve/src/shared/enum/view_state_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_uistate.dart';

class CartViewModel extends Notifier<CartUistate> {
  @override
  CartUistate build() {
    return CartUistate.empty();
  }

  void addToCart(CartItem item) {
    /// Check if the item already exists in the cart
    final existingItemIndex = state.cart
        .indexWhere((cartItem) => cartItem.productId == item.productId);
    if (existingItemIndex != -1) {
      // If the item exists, update its quantity
      final updatedCart = List<CartItem>.from(state.cart);
      updatedCart[existingItemIndex] = updatedCart[existingItemIndex].copyWith(
        quantity: updatedCart[existingItemIndex].quantity + item.quantity,
      );
      state = state.copyWith(
        viewState: ViewState.success,
        cart: updatedCart,
        message:
            'Item quantity updated in cart to ${updatedCart[existingItemIndex].quantity}',
      );
      return;
    } else {
      // If the item does not exist, add it to the cart
      final updatedCart = List<CartItem>.from(state.cart)..add(item);
      state = state.copyWith(
        viewState: ViewState.success,
        cart: updatedCart,
        message: 'Item added to cart',
      );
    }
    calculateSubTotal();
  }

  void removeFromCart(int productId) {
    final updatedCart =
        state.cart.where((item) => item.productId != productId).toList();
    state = state.copyWith(
      viewState: ViewState.idle,
      cart: updatedCart,
    );
    calculateSubTotal();
  }

  void clearCart() {
    state = state.copyWith(
      viewState: ViewState.idle,
      cart: [],
    );
    calculateSubTotal();
  }

  void updateCartItemQuantity(int productId, int quantity) {
    final updatedCart = state.cart.map((item) {
      if (item.productId == productId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();

    state = state.copyWith(
      viewState: ViewState.idle,
      cart: updatedCart,
    );
    calculateSubTotal();
  }

  void calculateSubTotal() {
    final subTotal = state.cart.fold<num>(
      0.0,
      (previousValue, item) => previousValue + (item.price * item.quantity),
    );
    state = state.copyWith(
      viewState: ViewState.idle,
      subTotal: subTotal,
    );
  }

  void resetVM() {
    state = state.copyWith(
      viewState: ViewState.idle,
      message: "",
    );
  }
}

final cartViewModelProvider = NotifierProvider<CartViewModel, CartUistate>(
  CartViewModel.new,
);
