import 'package:alpha_twelve/src/shared/enum/view_state_enum.dart';

import '../../product/models/product_response_dto.dart';

class HomepageUIState {
  final ViewState viewState;
  final String errorMessage;
  final String token;
  final List<ProductModel> products;

  const HomepageUIState({
    this.viewState = ViewState.idle,
    required this.errorMessage,
    required this.token,
    required this.products,
  });

  /// Factory constructor for an empty state
  factory HomepageUIState.empty() {
    return const HomepageUIState(
      viewState: ViewState.idle,
      errorMessage: "",
      token: "",
      products: [],
    );
  }

  /// CopyWith method to create a new instance with modified fields
  HomepageUIState copyWith({
    ViewState? viewState,
    String? errorMessage,
    String? token,
    List<ProductModel>? products,
  }) {
    return HomepageUIState(
      viewState: viewState ?? this.viewState,
      errorMessage: errorMessage ?? this.errorMessage,
      token: token ?? this.token,
      products: products ?? this.products,
    );
  }
}
