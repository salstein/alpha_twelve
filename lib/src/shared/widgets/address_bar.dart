import 'package:alpha_twelve/src/shared/utils/constants.dart';
import 'package:alpha_twelve/src/style/theme/color%20scheme/alpha_colors.dart';
import 'package:alpha_twelve/src/style/theme/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AlphaConstants.mediumSpace.w,
        vertical: AlphaConstants.mediumSpace.h,
      ),
      child: Row(
        children: [
          Container(
            width: 56.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: AlphaColors.primaryBlue,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          AlphaConstants.bigSpaceM.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'DELIVERY ADDRESS',
                  style: context.labelSmall?.semiBold,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Yaba, Lagos, Nigeria',
                  style: context.labelLarge?.semiBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          Icon(
            HugeIcons.strokeRoundedNotification02,
            size: 24.r,
          ),
        ],
      ),
    );
  }
}
