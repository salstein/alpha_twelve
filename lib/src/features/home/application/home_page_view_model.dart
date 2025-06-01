import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/enum/view_state_enum.dart';
import '../../../shared/services/api service/products_repository.dart';
import 'home_page_ui_state.dart';

class HomepageViewModel extends AutoDisposeNotifier<HomepageUIState> {
  late ProductsRepository _productsRepository;

  @override
  HomepageUIState build() {
    _productsRepository = ProductsRepository();
    return HomepageUIState.empty();
  }

  Future<void> fetchProducts() async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final products = await _productsRepository.fetchProducts();
      state = state.copyWith(
        viewState: ViewState.success,
        products: products.products,
      );
    } catch (e) {
      state = state.copyWith(
        viewState: ViewState.error,
        errorMessage: e.toString(),
      );
    }
  }
}

final homepageViewModelProvider =
    AutoDisposeNotifierProvider<HomepageViewModel, HomepageUIState>(
  HomepageViewModel.new,
);
