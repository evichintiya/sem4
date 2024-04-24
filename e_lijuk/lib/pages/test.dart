
import 'package:e_lijuk/pages/beranda_screen.dart';
import 'package:e_lijuk/pages/login.dart';
import 'package:e_lijuk/pages/notifikasi_screen.dart';
import 'package:e_lijuk/pages/profile_screen.dart';
import 'package:e_lijuk/pages/riwayat_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

 @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  
    List<Widget> _buildScreens() {
        return [
          BerandaPage(),
          RiwayatPemesanan(),
          Profile()
        ];
    }

  List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
          PersistentBottomNavBarItem(
                icon: Icon(Icons.home),
                title: ("Beranda"),
                activeColorPrimary: Colors.black,
                inactiveColorPrimary: Colors.black,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.history),
                title: ("Riwayat"),
                activeColorPrimary: Colors.black,
                inactiveColorPrimary: Colors.black,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.account_circle_outlined),
                title: ("Profil"),
                activeColorPrimary: Colors.black,
                inactiveColorPrimary: Colors.black,
            ),
        ];
    }
}