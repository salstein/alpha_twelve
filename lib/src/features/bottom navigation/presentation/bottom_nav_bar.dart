import 'package:alpha_twelve/src/features/bottom%20navigation/models/nav_item_object.dart';
import 'package:alpha_twelve/src/features/cart/application/cart_view_model.dart';
import 'package:alpha_twelve/src/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:alpha_twelve/src/features/home/presentation/screens/home_screen.dart';
import 'package:alpha_twelve/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:alpha_twelve/src/routing/routing.dart';
import 'package:alpha_twelve/src/style/theme/color%20scheme/alpha_colors.dart';
import 'package:alpha_twelve/src/style/theme/typography/typography.dart';
import 'package:alpha_twelve/src/style/theme/typography/typography_on_ctx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hugeicons/hugeicons.dart';

class CustomBottomNavBar extends ConsumerStatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  ConsumerState<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends ConsumerState<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<NavItemObject> navigationItems = [
    NavItemObject(
      icon: HugeIcons.strokeRoundedHome07,
      title: 'Home',
    ),
    NavItemObject(
      icon: HugeIcons.strokeRoundedShoppingCart01,
      title: 'Cart',
    ),
    NavItemObject(
      icon: HugeIcons.strokeRoundedFavourite,
      title: 'Favorites',
    ),
    NavItemObject(
      icon: HugeIcons.strokeRoundedUserCircle,
      title: 'Profile',
    ),
  ];

  final List<Widget> screens = const [
    HomepageScreen(),
   SizedBox.shrink(),
    FavoritesScreen(),
    ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTap(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            IndexedStack(
              index: _selectedIndex,
              children: screens,
            ),
            Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  height: 80.h,

                  // padding: const EdgeInsets.symmetric(horizontal: 20., vertical: 12),
                  decoration: const BoxDecoration(
                    color: AlphaColors.whiteColor,
                  ),
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        navigationItems.length,
                        (index) => GestureDetector(
                          onTap: () {
                            if (index == 1) {
                              context.pushNamed(AppRoute.cartScreen.name);
                              return;
                            }
                            setState(() {
                              _selectedIndex = index;
                              _onItemTap(index);
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.h, horizontal: 16.w),
                                decoration: BoxDecoration(
                                  color: _selectedIndex == index
                                      ? AlphaColors.primaryBlue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Badge(
                                  isLabelVisible: index == 1 &&
                                      ref
                                          .watch(cartViewModelProvider)
                                          .cart
                                          .isNotEmpty, // Example for Cart
                                  backgroundColor:
                                      AlphaColors.greyShade.shade600,
                                  label: Text(
                                    ref
                                        .watch(cartViewModelProvider)
                                        .cart
                                        .length
                                        .toString(),
                                    style: context.labelSmall?.copyWith(
                                      color: AlphaColors.whiteColor,
                                    ),
                                  ),
                                  child: Icon(
                                    navigationItems[index].icon,
                                    size: 24.sp,
                                    color: _selectedIndex == index
                                        ? AlphaColors.whiteColor
                                        : AlphaColors.blackColor,
                                  ),
                                ),
                              ),
                              Text(
                                navigationItems[index].title,
                                style: context.labelLarge?.copyWith(
                                  fontWeight: _selectedIndex == index
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: _selectedIndex == index
                                      ? AlphaColors.primaryBlue
                                      : AlphaColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
