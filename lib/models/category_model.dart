class MyCardsCategory {
  int categoryId;
  String categoryName;
  String categoryIconPath;


  MyCardsCategory(this.categoryId, this.categoryName, this.categoryIconPath);

  String get name => categoryName;

  String get iconPath => categoryIconPath;

  int get id => categoryId;
}