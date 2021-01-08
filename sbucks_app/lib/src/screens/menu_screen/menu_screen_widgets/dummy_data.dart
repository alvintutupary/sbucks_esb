import 'package:sbucks/src/models/menu_model.dart';

class DummyData {
  final menuCategories = List<MenuCategoryModel>()
    ..add(
      MenuCategoryModel(
          'assets/img/menu-m-1.jpg', 'Title 1', menuCategoryDetails),
    )
    ..add(
      MenuCategoryModel(
          'assets/img/menu-s-1.jpg', 'Title 2', menuCategoryDetails),
    )
    ..add(
      MenuCategoryModel(
          'assets/img/menu-s-2.jpg', 'Title 3', menuCategoryDetails),
    )
    ..add(
      MenuCategoryModel(
          'assets/img/menu-s-3.jpg', 'Title 4', menuCategoryDetails),
    )
    ..add(
      MenuCategoryModel(
          'assets/img/menu-s-4.jpg', 'Title 4', menuCategoryDetails),
    )
    ..add(
      MenuCategoryModel(
          'assets/img/menu-s-3.jpg', 'Title 5', menuCategoryDetails),
    );

  static final menuCategoryDetails = List<MenuCategoryDetailModel>()
    ..add(
      MenuCategoryDetailModel(
          'assets/img/menu-s-1.jpg', 'Title 2', menuDetails),
    )
    ..add(
      MenuCategoryDetailModel(
          'assets/img/menu-s-2.jpg', 'Title 3', menuDetails),
    )
    ..add(
      MenuCategoryDetailModel(
          'assets/img/menu-s-3.jpg', 'Title 4', menuDetails),
    )
    ..add(
      MenuCategoryDetailModel(
          'assets/img/menu-s-3.jpg', 'Title 4', menuDetails),
    )
    ..add(
      MenuCategoryDetailModel(
          'assets/img/menu-s-3.jpg', 'Title 4', menuDetails),
    )
    ..add(
      MenuCategoryDetailModel(
          'assets/img/menu-s-4.jpg', 'Title 4', menuDetails),
    )
    ..add(
      MenuCategoryDetailModel(
          'assets/img/menu-s-3.jpg', 'Title 5', menuDetails),
    );

  static final menuDetails = List<MenuDetailModel>()
    ..add(
      MenuDetailModel('assets/img/menu-s-1.jpg', 'Title 2',
          'https://qoqi.co.id/kebijakan-privasi.html'),
    )
    ..add(
      MenuDetailModel('assets/img/menu-s-2.jpg', 'Title 3',
          'https://qoqi.co.id/kebijakan-privasi.html'),
    )
    ..add(
      MenuDetailModel('assets/img/menu-s-3.jpg', 'Title 4',
          'https://qoqi.co.id/kebijakan-privasi.html'),
    )
    ..add(
      MenuDetailModel('assets/img/menu-s-3.jpg', 'Title 4',
          'https://qoqi.co.id/kebijakan-privasi.html'),
    )
    ..add(
      MenuDetailModel('assets/img/menu-s-3.jpg', 'Title 4',
          'https://qoqi.co.id/kebijakan-privasi.html'),
    )
    ..add(
      MenuDetailModel('assets/img/menu-s-4.jpg', 'Title 4',
          'https://qoqi.co.id/kebijakan-privasi.html'),
    )
    ..add(
      MenuDetailModel('assets/img/menu-s-3.jpg', 'Title 5',
          'https://qoqi.co.id/kebijakan-privasi.html'),
    );
}
