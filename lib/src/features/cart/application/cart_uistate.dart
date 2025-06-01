import 'package:alpha_twelve/src/shared/enum/view_state_enum.dart';
import '../models/cart_object_dto.dart';

class CartUistate {
  final ViewState viewState;
  final String message;
  final String token;
  final List<CartItem> cart;
  final num subTotal;
  final num shippingCost;

  const CartUistate({
    this.viewState = ViewState.idle,
    required this.message,
    required this.token,
    required this.cart,
    required this.subTotal,
    required this.shippingCost,
  });

  /// Factory constructor for an empty state
  factory CartUistate.empty() {
    return const CartUistate(
        viewState: ViewState.idle,
        message: "",
        token: "",
        cart: [],
        subTotal: 0.0,
        shippingCost: 10.0);
  }

  /// CopyWith method to create a new instance with modified fields
  CartUistate copyWith({
    ViewState? viewState,
    String? message,
    String? token,
    List<CartItem>? cart,
    num? subTotal,
    num? shippingCost,
  }) {
    return CartUistate(
      viewState: viewState ?? this.viewState,
      message: message ?? this.message,
      token: token ?? this.token,
      cart: cart ?? this.cart,
      subTotal: subTotal ?? this.subTotal,
      shippingCost: shippingCost ?? this.shippingCost,
    );
  }
}
