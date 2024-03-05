import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile.dart';
import 'package:dalel/features/search/presentation/views/search_view_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: _controller,
      items: _navBarsItems(),
      backgroundColor: AppColors.primaryColor,
      navBarStyle: NavBarStyle.style12,
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    );
  }
}

List<Widget> _buildScreens() {
  return [
     BlocProvider(
      create: (context) => HomeCubit()..getHistoricalPeriods(),
      child: const HomeView(),
    ),
    const CartView(),
    const SearchView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: AppColors.activeColorPrimary,
      inactiveColorPrimary: AppColors.inactiveColorPrimary,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.cart),
      title: ("Cart"),
      activeColorPrimary: AppColors.activeColorPrimary,
      inactiveColorPrimary: AppColors.inactiveColorPrimary,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.search),
      title: ("Search"),
      activeColorPrimary: AppColors.activeColorPrimary,
      inactiveColorPrimary: AppColors.inactiveColorPrimary,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person_fill),
      title: ("Profile"),
      activeColorPrimary: AppColors.activeColorPrimary,
      inactiveColorPrimary: AppColors.inactiveColorPrimary,
    ),
  ];
}
