import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/cart/cart.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:amazon/view/user/menu/menu.dart';
import 'package:amazon/view/user/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class NavBarClass extends StatefulWidget {
  const NavBarClass({super.key});

  @override
  State<NavBarClass> createState() => _NavBarClassState();
}

class _NavBarClassState extends State<NavBarClass> {
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ProfileScreen(),
      const CartScreen(),
      const Menu(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: "Home",
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: "You",
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.cart),
        title: "Cart",
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu),
        title: "Menu",
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ProfileScreen(),
      const CartScreen(),
      const Menu(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: "Home",
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: "You",
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.cart),
        title: "Cart",
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu),
        title: "Menu",
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: tabController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
