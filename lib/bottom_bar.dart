import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:seclob/view/home_screen.dart';

class BottomBar extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  BottomBar({super.key});

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.home),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.search),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_a_photo_outlined),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.squareYoutube),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color.fromARGB(191, 0, 72, 131),
      stateManagement: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }
}
