import 'package:alpha_twelve/src/shared/enum/view_state_enum.dart';

import '../models/product_response_dto.dart';

class ProductDetailsUistate {
  final ViewState viewState;
  final String errorMessage;
  final String token;
  final ProductModel product;

  const ProductDetailsUistate({
    this.viewState = ViewState.idle,
    required this.errorMessage,
    required this.token,
    required this.product,
  });

  /// Factory constructor for an empty state
  factory ProductDetailsUistate.empty() {
    return ProductDetailsUistate(
      viewState: ViewState.idle,
      errorMessage: "",
      token: "",
      product: ProductModel.empty(),
    );
  }

  /// CopyWith method to create a new instance with modified fields
  ProductDetailsUistate copyWith({
    ViewState? viewState,
    String? errorMessage,
    String? token,
    ProductModel? product,
  }) {
    return ProductDetailsUistate(
      viewState: viewState ?? this.viewState,
      errorMessage: errorMessage ?? this.errorMessage,
      token: token ?? this.token,
      product: product ?? this.product,
    );
  }
}
