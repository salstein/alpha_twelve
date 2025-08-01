import 'package:alpha_twelve/src/shared/utils/utils.dart';
import 'package:alpha_twelve/src/style/theme/color%20scheme/alpha_colors.dart';
import 'package:alpha_twelve/src/style/theme/typography/typography_on_ctx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class TopSnackbar extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  const TopSnackbar({
    super.key,
    required this.message,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AlphaConstants.mediumSpace.w),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(AlphaConstants.smallSpace.r),
          color: AlphaColors.successColor,
          child: Row(
            children: [
              (AlphaConstants.smallSpace / 2).w.horizontalSpace,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AlphaConstants.smallSpace.r),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AlphaConstants.mediumSpace.w,
                      vertical: AlphaConstants.mediumSpace.h),
                  child: Row(
                    children: [
                      const Icon(HugeIcons.strokeRoundedCheckmarkCircle01,
                          color: AlphaColors.successColor),
                      AlphaConstants.smallSpace.w.horizontalSpace,
                      Expanded(child: Text(message, style: context.bodySmall)),
                      GestureDetector(
                        onTap: onClose,
                        child: const Icon(Icons.close,
                            color: AlphaColors.blackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
