import 'package:alpha_twelve/src/features/home/application/home_page_view_model.dart';
import 'package:alpha_twelve/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/product_card.dart';

class HomepageScreen extends ConsumerStatefulWidget {
  const HomepageScreen({super.key});

  @override
  ConsumerState<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends ConsumerState<HomepageScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      ref.read(homepageViewModelProvider.notifier).fetchProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const _TopBar(),
        AlphaConstants.mediumSpace.h.verticalSpace,
        const SectionCard(
          title: 'Technology',
        ),
        AlphaConstants.smallSpace.h.verticalSpace,
        Expanded(
            child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AlphaConstants.mediumSpace.w),
          child: const _ProductsGrid(),
        )),
      ],
    )));
  }
}



class _ProductsGrid extends ConsumerWidget {
  const _ProductsGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(homepageViewModelProvider).products;
    return SingleChildScrollView(
      child: Column(children: [
        AlphaConstants.smallSpace.h.verticalSpace,
        const SectionTitle(title: 'Smartphones, Laptops & Assecories'),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 5.w,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length, // Replace with actual product count
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
        (AlphaConstants.bigSpaceX * 2).h.verticalSpace,
      ]),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Bar

        const AddressBar(),

        /// Search Bar
        const SizedBox(height: 16),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AlphaConstants.mediumSpace.w,
          ),
          child: const SearchField()
        ),
      ],
    );
  }
}




