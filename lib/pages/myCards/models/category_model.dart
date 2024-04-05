class MyCardsCategory {
  int categoryId;
  String categoryName;
  //String categoryIconPath;


  MyCardsCategory(this.categoryId,
      this.categoryName);

  String get name => categoryName;

  //String get iconPath => categoryIconPath;

  int get id => categoryId;

  Map<String, dynamic> toMap() {
    return {
      'categoryId': this.categoryId,
      'categoryName': this.categoryName,
      //'categoryIconPath': this.categoryIconPath,
    };
  }


}