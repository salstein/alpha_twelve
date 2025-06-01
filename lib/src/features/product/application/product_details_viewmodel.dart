import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/enum/view_state_enum.dart';
import '../../../shared/services/api service/products_repository.dart';
import 'product_details_uistate.dart';

class ProductDetailsViewModel
    extends AutoDisposeNotifier<ProductDetailsUistate> {
  late ProductsRepository _productsRepository;

  @override
  ProductDetailsUistate build() {
    _productsRepository = ProductsRepository();
    return ProductDetailsUistate.empty();
  }

  Future<void> fetchProduct(int id) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final products = await _productsRepository.getProductById(id);
      state = state.copyWith(
        viewState: ViewState.success,
        product: products,
      );
    } catch (e) {
      state = state.copyWith(
        viewState: ViewState.error,
        errorMessage: e.toString(),
      );
    }
  }
}

final productDetailsViewModelProvider =
    AutoDisposeNotifierProvider<ProductDetailsViewModel, ProductDetailsUistate>(
  ProductDetailsViewModel.new,
);
