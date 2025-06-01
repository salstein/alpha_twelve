import 'package:alpha_twelve/src/features/cart/application/cart_view_model.dart';
import 'package:alpha_twelve/src/features/cart/models/cart_object_dto.dart';
import 'package:alpha_twelve/src/shared/utils/constants.dart';
import 'package:alpha_twelve/src/style/colors/alpha_colors.dart';
import 'package:alpha_twelve/src/style/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../shared/utils/snack_bar.dart';

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({super.key, required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartViewNotifier = ref.watch(cartViewModelProvider.notifier);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AlphaConstants.smallSpaceM.w,
          vertical: AlphaConstants.smallSpaceX.h),
      margin: EdgeInsets.only(
        bottom: AlphaConstants.mediumSpace.h,
        left: AlphaConstants.mediumSpace.w,
        right: AlphaConstants.mediumSpace.w,
      ),
      decoration: BoxDecoration(
        color: AlphaColors.greyShade.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 103.w,
            height: 106.h,
            child: Image.asset(
              cartItem.imageUrl,
            ),
          ),
          SizedBox(width: AlphaConstants.smallSpaceM.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(cartItem.name,
                    style: context.labelLarge?.copyWith(
                      color: AlphaColors.greyShade.shade700,
                    )),
                SizedBox(height: 4.h),
                Text('\$${cartItem.totalPrice.toStringAsFixed(2)}',
                    style: context.bodyLarge?.bold.copyWith()),
                AlphaConstants.smallSpace.h.verticalSpace,
                Text(
                  'In stock',
                  style: context.bodySmall?.regular.copyWith(
                    color: AlphaColors.successColor,
                  ),
                ),
                AlphaConstants.smallSpace.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: AlphaConstants.mediumSpace.r,
                      backgroundColor: AlphaColors.greyShade.shade200,
                      child: IconButton(
                        icon: const Icon(Icons.remove, size: 16),
                        onPressed: () {
                          if (cartItem.quantity == 1) {
                            showTopSnackbar(context,
                                "You cannot reduce the quantity below 1. Delete the item instead.");
                            return;
                          }
                          cartViewNotifier.updateCartItemQuantity(
                            cartItem.productId,
                            cartItem.quantity - 1,
                          );
                        },
                      ),
                    ),
                    Text('${cartItem.quantity}'),
                    Container(
                        width: AlphaConstants.bigSpace.w,
                        height: AlphaConstants.bigSpace.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AlphaColors.greyShade.shade200,
                          ),
                          color: AlphaColors.whiteColor,
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: const Icon(Icons.add,
                              size: 16, color: AlphaColors.blackColor),
                          onPressed: () {
                            cartViewNotifier.updateCartItemQuantity(
                              cartItem.productId,
                              cartItem.quantity + 1,
                            );
                          },
                        )),
                    IconButton(
                      icon: CircleAvatar(
                          radius: AlphaConstants.mediumSpace.r,
                          backgroundColor: AlphaColors.whiteColor,
                          child: const Icon(HugeIcons.strokeRoundedDelete02,
                              size: 16)),
                      onPressed: () {
                        cartViewNotifier.removeFromCart(cartItem.productId);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
