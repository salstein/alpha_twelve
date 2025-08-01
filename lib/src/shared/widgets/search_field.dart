import 'package:alpha_twelve/src/style/theme/color%20scheme/alpha_colors.dart';
import 'package:alpha_twelve/src/style/theme/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.h, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AlphaColors.greyShade.shade200,
                  width: 1.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AlphaColors.primaryBlue,
                  width: 2.w,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AlphaColors.greyShade.shade200,
                  width: 1.w,
                ),
              ),
              prefixIcon: Icon(
                HugeIcons.strokeRoundedSearch01,
                color: AlphaColors.greyShade.shade500,
                size: 20.sp,
              ),
            ),
            style: context.bodySmall?.regular,
          );
  }
}