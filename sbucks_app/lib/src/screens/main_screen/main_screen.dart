import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:sbucks/src/models/main_menu_model.dart';
import 'package:sbucks/src/screens/home_screen/home_screen.dart';
import 'package:sbucks/src/screens/main_screen/main_screen_widgets/main_buttom_navbar.dart';
import 'package:sbucks/src/screens/menu_screen/menu_screen.dart';
import 'package:sbucks/src/screens/payment_screen/payment_screen.dart';
import 'package:sbucks/src/screens/reward_screen/reward_screen.dart';
import 'package:sbucks/src/screens/store_screen/store_screen.dart';

class MainScreen extends StatefulWidget {
  static const kRouteName = '/main';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _mainMenu = List<MainMenuModel>()
    ..add(MainMenuModel(HomeScreen(), 'HOME', Icons.home))
    ..add(MainMenuModel(PaymentScreen(), 'PAY', Icons.payment))
    ..add(MainMenuModel(RewardScreen(), 'REWARD', Icons.star))
    ..add(MainMenuModel(MenuScreen(), 'MENU', Icons.restaurant_menu))
    ..add(MainMenuModel(StoreScreen(), 'STORE', Icons.store));

  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);

    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);

    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            checkUserDragging(scrollNotification);
          },
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              return _mainMenu[index].page;
            },
            itemCount: _mainMenu.length,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        bottomNavigationBar: buttomNavBar(
          _pageController,
          _menuPositionController,
          userPageDragging,
          _mainMenu,
        ));
  }
}
