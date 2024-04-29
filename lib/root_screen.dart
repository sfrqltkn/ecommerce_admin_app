import 'package:ecommerce_admin_app/screen/card/card_screen.dart';
import 'package:ecommerce_admin_app/screen/home_screen.dart';
import 'package:ecommerce_admin_app/screen/profile_screen.dart';
import 'package:ecommerce_admin_app/screen/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  int currentScreen = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();

    screens = const [
      HomeScreen(),
      SearchScreen(),
      CardScreen(),
      ProfileScreen(),
    ];

    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.person),
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.person),
            icon: Icon(CupertinoIcons.search),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyLight.bag_2),
            icon: Badge(
              backgroundColor: Colors.red,
              textColor: Colors.white,
              label: Text("5"),
              child: Icon(IconlyLight.bag_2),
            ),
            label: "Card",
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.person),
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
        selectedIndex: currentScreen,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
      ),
    );
  }
}
