class FoodsModel {
  String? foodName;
  double? foodRating;
  String? foodImage;
  String? preparationTime;
  int? price;
  String? category;

  FoodsModel(this.foodName, this.foodRating, this.foodImage,
      this.preparationTime, this.price, this.category);
}

class FoodsModelData {
  static List<FoodsModel> getFoods = [
    FoodsModel(
        "Biryan Kuku", 4.9, "./assets/biryanikuku.png", "15 min", 15000, ''),
    FoodsModel("Chips Kavu", 4.9, "./assets/chipskavu.png", "15 min", 7500, ''),
    FoodsModel("Wali Kuku", 4.9, "./assets/walikuku.png", "15 min", 12000, ''),
    FoodsModel(
        "Wali nyama", 4.9, "./assets/walinyama.png", "15 min", 10000, ''),
    FoodsModel(
        "Biryan Kuku", 4.9, "./assets/biryanikuku.png", "15 min", 15000, ''),
    FoodsModel("Chips Kavu", 4.9, "./assets/chipskavu.png", "15 min", 7500, ''),
    FoodsModel("Wali Kuku", 4.9, "./assets/walikuku.png", "15 min", 12000, ''),
    FoodsModel(
        "Wali nyama", 4.9, "./assets/walinyama.png", "15 min", 10000, ''),
    FoodsModel(
        "Biryan Kuku", 4.9, "./assets/biryanikuku.png", "15 min", 15000, ''),
    FoodsModel("Chips Kavu", 4.9, "./assets/chipskavu.png", "15 min", 7500, ''),
    FoodsModel("Wali Kuku", 4.9, "./assets/walikuku.png", "15 min", 12000, ''),
    FoodsModel(
        "Wali nyama", 4.9, "./assets/walinyama.png", "15 min", 10000, ''),
    FoodsModel(
        "Biryan Kuku", 4.9, "./assets/biryanikuku.png", "15 min", 15000, ''),
    FoodsModel("Chips Kavu", 4.9, "./assets/chipskavu.png", "15 min", 7500, ''),
    FoodsModel("Wali Kuku", 4.9, "./assets/walikuku.png", "15 min", 12000, ''),
    FoodsModel(
        "Wali nyama", 4.9, "./assets/walinyama.png", "15 min", 10000, ''),
  ];

  static List<FoodsModel> displayFoods = List.from(FoodsModelData.getFoods);
}

class CoffeeModel {
  String? coffeeName;
  double? coffeeRating;
  String? coffeeImage;
  String? preparationTime;
  int? price;
  String? category;

  CoffeeModel(this.coffeeName, this.coffeeRating, this.coffeeImage,
      this.preparationTime, this.price, this.category);
}

class CoffeeModelData {
  static List<CoffeeModel> getCoffee = [
    CoffeeModel(
        "Arabica Coffee", 4.9, "./assets/arabica.jpeg", "5 min", 5000, ''),
    CoffeeModel(
        "Liberica Coffee", 4.9, "./assets/liberica.jpeg", "5 min", 7500, ''),
    CoffeeModel("Milky Coffee", 4.9, "./assets/milky.jpeg", "5 min", 12000, ''),
    CoffeeModel(
        "Robusta Coffee", 4.9, "./assets/robusta.jpeg", "5 min", 10000, ''),
    CoffeeModel(
        "Arabica Coffee", 4.9, "./assets/arabica.jpeg", "5 min", 5000, ''),
    CoffeeModel(
        "Liberica Coffee", 4.9, "./assets/liberica.jpeg", "5 min", 7500, ''),
    CoffeeModel("Milky Coffee", 4.9, "./assets/milky.jpeg", "5 min", 12000, ''),
    CoffeeModel("Nguu Coffee", 4.9, "./assets/nguu.jpeg", "5 min", 10000, ''),
    CoffeeModel(
        "Arabica Coffee", 4.9, "./assets/arabica.jpeg", "5 min", 5000, ''),
    CoffeeModel(
        "Liberica Coffee", 4.9, "./assets/liberica.jpeg", "5 min", 7500, ''),
    CoffeeModel("Milky Coffee", 4.9, "./assets/milky.jpeg", "5 min", 12000, ''),
    CoffeeModel("Nguu Coffee", 4.9, "./assets/nguu.jpeg", "5 min", 10000, ''),
    CoffeeModel(
        "Arabica Coffee", 4.9, "./assets/arabica.jpeg", "5 min", 5000, ''),
    CoffeeModel(
        "Liberica Coffee", 4.9, "./assets/liberica.jpeg", "5 min", 7500, ''),
    CoffeeModel("Tanga Coffee", 4.9, "./assets/tanga.jpeg", "5 min", 12000, ''),
    CoffeeModel("Nguu Coffee", 4.9, "./assets/nguu.jpeg", "5 min", 10000, ''),
  ];

  static List<CoffeeModel> displayCoffee = List.from(CoffeeModelData.getCoffee);
}

class SoftDrinksModel {
  String? softDrinkName;
  double? softDrinkRating;
  String? softDrinkImage;
  String? preparationTime;
  int? price;
  String? category;

  SoftDrinksModel(this.softDrinkName, this.softDrinkRating, this.softDrinkImage,
      this.preparationTime, this.price, this.category);
}

class SoftDrinksModelData {
  static List<SoftDrinksModel> getSoftDrinks = [
    SoftDrinksModel(
        "Arabica ", 4.9, "./assets/cocktail.jpeg", "5 min", 5000, ''),
    SoftDrinksModel(
        "Liberica ", 4.9, "./assets/Sprite.jpeg", "5 min", 7500, ''),
    SoftDrinksModel("Pepsi ", 4.9, "./assets/Pepsi.jpeg", "5 min", 12000, ''),
    SoftDrinksModel(
        "Cocktail ", 4.9, "./assets/cocktail.jpeg", "5 min", 10000, ''),
    SoftDrinksModel("Arabica ", 4.9, "./assets/dew.jpeg", "5 min", 5000, ''),
    SoftDrinksModel("Sprite ", 4.9, "./assets/Sprite.jpeg", "5 min", 7500, ''),
    SoftDrinksModel("Pepsi ", 4.9, "./assets/Pepsi.jpeg", "5 min", 12000, ''),
    SoftDrinksModel("Cocacola ", 4.9, "./assets/coke.jpeg", "5 min", 10000, ''),
    SoftDrinksModel(
        "Mountain dew ", 4.9, "./assets/dew.jpeg", "5 min", 5000, ''),
    SoftDrinksModel("Sprite ", 4.9, "./assets/Sprite.jpeg", "5 min", 7500, ''),
    SoftDrinksModel("Pepsi ", 4.9, "./assets/Pepsi.jpeg", "5 min", 12000, ''),
    SoftDrinksModel("Cocacola ", 4.9, "./assets/coke.jpeg", "5 min", 10000, ''),
    SoftDrinksModel(
        "Mountain dew ", 4.9, "./assets/dew.jpeg", "5 min", 5000, ''),
    SoftDrinksModel("Sprite ", 4.9, "./assets/Sprite.jpeg", "5 min", 7500, ''),
    SoftDrinksModel("Cocacola ", 4.9, "./assets/coke.jpeg", "5 min", 12000, ''),
    SoftDrinksModel(
        "Orange Juice ", 4.9, "./assets/orangejuice.jpeg", "5 min", 10000, ''),
  ];

  static List<SoftDrinksModel> displaySoftDrinks =
      List.from(SoftDrinksModelData.getSoftDrinks);
}

class PaymentMethodsModel {
  String? paymentMethod;
  String? paymentImage;

  PaymentMethodsModel(this.paymentMethod, this.paymentImage);
}

class PaymentMethodModelData {
  static List<PaymentMethodsModel> getPaymentMethods = [
    PaymentMethodsModel("Mobile Money", "./assets/operation.png"),
    PaymentMethodsModel("Visa / Mastercard", "./assets/logo.png"),
    PaymentMethodsModel("Lipa Namba", "./assets/lipa.png"),
    PaymentMethodsModel("Cash", "./assets/cash-on-delivery.png"),
  ];
  static List<PaymentMethodsModel> displayPaymentMethods =
      List.from(PaymentMethodModelData.getPaymentMethods);
}
