class MenuCategoryModel {
  String imageUri;
  String title;
  List<MenuCategoryDetailModel> menuCategoryDetailModels;

  MenuCategoryModel(
    this.imageUri,
    this.title,
    this.menuCategoryDetailModels,
  );
}

class MenuCategoryDetailModel {
  String imageUri;
  String title;
  List<MenuDetailModel> menuDetailModels;

  MenuCategoryDetailModel(
    this.imageUri,
    this.title,
    this.menuDetailModels,
  );
}

class MenuDetailModel {
  String imageUri;
  String title;
  String descriptionUri;

  MenuDetailModel(
    this.imageUri,
    this.title,
    this.descriptionUri,
  );
}
