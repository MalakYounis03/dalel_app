import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/features/cart/presentation/views/cart_view.dart';
import 'package:dalel_app/features/home/presentation/views/home_view.dart';
import 'package:dalel_app/features/profile/presentation/views/profile_view.dart';
import 'package:dalel_app/features/search/presentation/views/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeNavBarWidget extends StatelessWidget {
  HomeNavBarWidget({super.key});
  final PersistentTabController _controller = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: _controller,
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [const HomeView(), CartView(), SearchView(), ProfileView()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Image.asset(Assets.imagesHomeIconActive),
      inactiveIcon: Image.asset(Assets.imagesHomeIcon),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(Assets.imagesShopingCartActive),
      inactiveIcon: Image.asset(Assets.imagesShoppingCart),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(Assets.imagesSearchActive),
      inactiveIcon: Image.asset(Assets.imagesSearch),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(Assets.imagesPersonActive),
      inactiveIcon: Image.asset(Assets.imagesPerson),
    ),
  ];
}
