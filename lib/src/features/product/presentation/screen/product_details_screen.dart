import 'package:alpha_twelve/src/features/cart/application/cart_view_model.dart';
import 'package:alpha_twelve/src/features/product/application/product_details_viewmodel.dart';
import 'package:alpha_twelve/src/features/product/models/product_response_dto.dart';
import 'package:alpha_twelve/src/routing/routing.dart';
import 'package:alpha_twelve/src/style/colors/alpha_colors.dart';
import 'package:alpha_twelve/src/style/theme/typography/typography.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../shared/shared.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId})
      : assert(productId > 0);

  /// The ID of the product to display details for.
  final int productId;

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  void initState() {
    ref.listenManual(cartViewModelProvider.select((value) => value.viewState),
        (prev, next) {
      if (next.isSuccess) {
        showTopSnackbar(context, ref.read(cartViewModelProvider).message);

        Future.delayed(const Duration(milliseconds: 100), () {
          ref.read(cartViewModelProvider.notifier).resetVM();
        });
      }
    });

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      ref.read(productDetailsViewModelProvider.notifier).fetchProduct(
            widget.productId,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productDetailsViewModelProvider).product;
    return Scaffold(
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: () {
              ref
                  .read(cartViewModelProvider.notifier)
                  .addToCart(product.toCartItem());
            },
            child: const Text('Add to Cart')),
      ],
      body: SafeArea(
        child: Hero(
          tag: 'product-${widget.productId}',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AddressBar(),
              SectionCard(
                title: 'Go Back',
                onTap: () {
                  context.pop();
                },
              ),
              const Expanded(child: _ProductDetailsBody())
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductDetailsBody extends ConsumerWidget {
  const _ProductDetailsBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productDetailsViewModelProvider).product;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AlphaConstants.mediumSpaceM.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlphaConstants.mediumSpace.h.verticalSpace,
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 20.w, top: 20.h),
              height: 332.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  image: AssetImage(
                    product.imageUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: SizedBox(
                height: 44.h,
                child: CircleAvatar(
                  radius: 22.r,
                  backgroundColor: AlphaColors.whiteColor,
                  child: const Icon(
                    HugeIcons.strokeRoundedFavourite,
                  ),
                ),
              ),
            ),
            AlphaConstants.smallSpaceM.h.verticalSpace,
            Text(
              "${product.name} ${product.extra}|${product.color}",
              style: context.bodyMedium,
              textAlign: TextAlign.center,
            ),
            AlphaConstants.smallSpaceM.h.verticalSpace,
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: context.headlineMedium?.bold.copyWith(
                fontSize: 24.sp,
              ),
            ),
            AlphaConstants.mediumSpaceM.h.verticalSpace,
            Text(
              "About this item",
              style: context.bodySmall?.copyWith(
                color: AlphaColors.greyShade.shade400,
              ),
            ),
            AlphaConstants.smallSpaceM.h.verticalSpace,
            ...List.generate(
              product.descriptions.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AlphaConstants.smallSpace.w.horizontalSpace,
                    Text(
                      "•",
                      style: context.bodySmall?.regular.copyWith(
                        color: AlphaColors.greyShade.shade400,
                      ),
                    ),
                    AlphaConstants.smallSpaceM.w.horizontalSpace,
                    Flexible(
                      child: Text(
                        " ${product.descriptions[index]}",
                        softWrap: true,
                        style: context.bodySmall?.regular.copyWith(
                          color: AlphaColors.greyShade.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AlphaConstants.mediumSpaceM.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
