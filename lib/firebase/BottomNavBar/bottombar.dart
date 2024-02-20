import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:practice/firebase/controller.dart/bottomNavrBarController.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    var navBarcontroller = Get.put(BottomNavBarController());
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              padding: const EdgeInsets.all(5),
              onTabChange: (index) {
                navBarcontroller.index.value = index;
              },
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Setting',
                ),
              ]),
        ),
      ),
      body: Obx(() => navBarcontroller.pages[navBarcontroller.index.value]),
    );
  }
}
