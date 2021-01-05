import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sbucks/src/models/main_menu_model.dart';

Widget buttomNavBar(
  PageController _pageController,
  MenuPositionController _menuPositionController,
  bool userPageDragging,
  List<MainMenuModel> mainMenu,
) {
  return BubbledNavigationBar(
    controller: _menuPositionController,
    initialIndex: 0,
    itemMargin: EdgeInsets.symmetric(horizontal: 8),
    backgroundColor: Colors.white,
    defaultBubbleColor: Colors.blue,
    onTap: (index) {
      _pageController.animateToPage(index,
          curve: Curves.easeInOutQuad, duration: Duration(milliseconds: 500));
    },
    items: mainMenu.map((menu) {
      var color = Color(0xff006442);
      return BubbledNavigationBarItem(
        icon: _buildIcon(menu.icon, color),
        activeIcon: _buildIcon(menu.icon, Colors.white),
        bubbleColor: color,
        title: Text(
          menu.title,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      );
    }).toList(),
  );
}

Padding _buildIcon(IconData icon, Color color) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 3),
    child: Icon(icon, size: 30, color: color),
  );
}
