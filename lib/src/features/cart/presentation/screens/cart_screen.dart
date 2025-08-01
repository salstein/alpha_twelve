import 'package:alpha_twelve/src/features/cart/application/cart_view_model.dart';
import 'package:alpha_twelve/src/routing/routing.dart';
import 'package:alpha_twelve/src/style/theme/color%20scheme/alpha_colors.dart';
import 'package:alpha_twelve/src/style/theme/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/shared.dart';
import '../widgets/cart_widget.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        if (ref.watch(cartViewModelProvider).cart.isNotEmpty) ...[
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          ),
        ]
      ],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AddressBar(),
            SectionCard(
              title: 'Your Cart',
              onTap: () {
                context.pop();
              },
            ),
            if (ref.watch(cartViewModelProvider).cart.isEmpty) ...[
              AlphaConstants.bigSpaceX.h.verticalSpace,
              const _EmptyCart()
            ] else
              const SizedBox.shrink(),
            if (ref.watch(cartViewModelProvider).cart.isNotEmpty) ...[
              AlphaConstants.mediumSpace.h.verticalSpace,
              const Expanded(child: _CartList()),
              // Add some spacing
              AlphaConstants.mediumSpace.h.verticalSpace,
              const _OrderInfo()
            ]
          ],
        ),
      ),
    );
  }
}

class _OrderInfo extends ConsumerWidget {
  const _OrderInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AlphaConstants.mediumSpace.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Info", style: context.bodySmall?.bold),
          AlphaConstants.mediumSpace.h.verticalSpace,
          Row(
            children: [
              Text("Subtotal", style: context.labelLarge?.medium),
              const Spacer(),
              Text(
                "\$${ref.watch(cartViewModelProvider).subTotal.toStringAsFixed(2)}",
                style: context.labelLarge?.medium,
              ),
            ],
          ),
          AlphaConstants.mediumSpace.h.verticalSpace,
          Row(
            children: [
              Text(
                "Shipping",
                style: context.labelLarge?.medium,
              ),
              const Spacer(),
              Text(
                "\$${ref.watch(cartViewModelProvider).shippingCost.toStringAsFixed(2)}",
                style: context.labelLarge?.medium,
              ),
            ],
          ),
          AlphaConstants.mediumSpace.h.verticalSpace,
          Row(
            children: [
              Text(
                "Total",
                style: context.labelLarge?.medium,
              ),
              const Spacer(),
              Text(
                "\$${ref.watch(cartViewModelProvider).subTotal + ref.watch(cartViewModelProvider).shippingCost}",
                style: context.bodySmall?.bold,
              ),
            ],
          ),
          AlphaConstants.mediumSpace.h.verticalSpace,
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart_outlined, size: 64),
          AlphaConstants.mediumSpace.h.verticalSpace,
          Text(
            'Your Cart is Empty',
            style: context.bodyLarge?.bold.copyWith(fontSize: 24),
          ),
          AlphaConstants.smallSpace.h.verticalSpace,
          Text(
            'Add some products to your cart to get started.',
            style: context.bodyMedium
                ?.copyWith(color: AlphaColors.greyShade.shade600),
            textAlign: TextAlign.center,
          ),
          AlphaConstants.mediumSpace.h.verticalSpace,
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Go to Products'),
          ),
          AlphaConstants.mediumSpace.h.verticalSpace,
          OutlinedButtonWithSta(
            enabled: true, // Replace with actual logic to enable/disable
            onPressed: () {},
            title: 'Continue Shopping',
          )
        ],
      ),
    );
  }
}

class OutlinedButtonWithSta extends StatelessWidget {
  const OutlinedButtonWithSta(
      {super.key, this.enabled = true, this.title, this.onPressed});
  final bool enabled;
  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          BorderSide(
              color: enabled
                  ? AlphaColors.primaryBlue
                  : AlphaColors.greyShade.shade400,
              width: 2),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ), // Replace with actual onPressed logic
      child: Text(
        title ?? 'Add title',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: AlphaTypography.ibmPlexSans(),
          color: enabled
              ? AlphaColors.primaryBlue
              : AlphaColors.greyShade.shade400,
        ),
      ),
    );
  }
}

class _CartList extends ConsumerWidget {
  const _CartList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartViewModel = ref.watch(cartViewModelProvider);
    return ListView.builder(
      itemCount:
          cartViewModel.cart.length, // Replace with actual cart item count
      itemBuilder: (context, index) {
        return CartItemWidget(
            cartItem:
                cartViewModel.cart[index]); // Replace with actual cart item
      },
    );
  }
}
