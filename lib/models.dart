class FoodsModel {
  String? foodName;
  double? foodRating;
  String? foodImage;
  String? preparationTime;
  int? price;

  FoodsModel(this.foodName, this.foodRating, this.foodImage,
      this.preparationTime, this.price);
}

class FoodsModelData {
  static List<FoodsModel> getFoods = [
    FoodsModel("Biryan Kuku", 4.9, "./assets/biryanikuku.png", "15 min", 15000),
    FoodsModel("Chips Kavu", 4.9, "./assets/chipskavu.png", "15 min", 7500),
    FoodsModel("Wali Kuku", 4.9, "./assets/walikuku.png", "15 min", 12000),
    FoodsModel("Wali nyama", 4.9, "./assets/walinyama.png", "15 min", 10000),
    FoodsModel("Biryan Kuku", 4.9, "./assets/biryanikuku.png", "15 min", 15000),
    FoodsModel("Chips Kavu", 4.9, "./assets/chipskavu.png", "15 min", 7500),
    FoodsModel("Wali Kuku", 4.9, "./assets/walikuku.png", "15 min", 12000),
    FoodsModel("Wali nyama", 4.9, "./assets/walinyama.png", "15 min", 10000),
    FoodsModel("Biryan Kuku", 4.9, "./assets/biryanikuku.png", "15 min", 15000),
    FoodsModel("Chips Kavu", 4.9, "./assets/chipskavu.png", "15 min", 7500),
    FoodsModel("Wali Kuku", 4.9, "./assets/walikuku.png", "15 min", 12000),
    FoodsModel("Wali nyama", 4.9, "./assets/walinyama.png", "15 min", 10000),
    FoodsModel("Biryan Kuku", 4.9, "./assets/biryanikuku.png", "15 min", 15000),
    FoodsModel("Chips Kavu", 4.9, "./assets/chipskavu.png", "15 min", 7500),
    FoodsModel("Wali Kuku", 4.9, "./assets/walikuku.png", "15 min", 12000),
    FoodsModel("Wali nyama", 4.9, "./assets/walinyama.png", "15 min", 10000),
  ];

  static List<FoodsModel> displayFoods = List.from(FoodsModelData.getFoods);
}
