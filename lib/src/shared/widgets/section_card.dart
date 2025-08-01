import 'package:alpha_twelve/src/style/theme/color%20scheme/alpha_colors.dart';
import 'package:alpha_twelve/src/style/theme/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({super.key, this.title, this.onTap});
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      
      decoration: BoxDecoration(
        border: Border.all(
          color: AlphaColors.greyShade.shade200,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: onTap,
           icon: const Icon(Icons.arrow_back_ios_new,
                size: 16, color: AlphaColors.blackColor),
          ),
          
          Text(
            title ?? '',
            style: context.bodyLarge?.bold,
          ),
        ],
      ),
    );
  }
}