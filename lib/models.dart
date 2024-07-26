class FoodsModel {
  String? foodName;
  double? foodRating;
  String? foodImage;
  String? foodDescription;
  String? preparationTime;
  int? price;
  String? category;

  FoodsModel(this.foodName, this.foodRating, this.foodImage,
      this.foodDescription, this.preparationTime, this.price, this.category);
}

class FoodsModelData {
  static List<FoodsModel> getFoods = [
    FoodsModel(
        "Biryani Kuku",
        4.9,
        "./assets/biryanikuku.png",
        "A flavorful Tanzanian rice dish cooked with chicken, spices, and vegetables.",
        "15 min",
        15000,
        ''),
    FoodsModel(
        "Chips Kavu",
        4.9,
        "./assets/chipskavu.png",
        "Crispy French fries (chips), a popular Tanzanian street food.",
        "15 min",
        7500,
        ''),
    FoodsModel(
        "Wali Kuku",
        4.9,
        "./assets/walikuku.png",
        "Traditional Tanzanian rice dish cooked with tender chicken and aromatic spices.",
        "15 min",
        12000,
        ''),
    FoodsModel(
        "Wali Nyama",
        4.9,
        "./assets/walinyama.png",
        "Hearty Tanzanian rice dish served with delicious beef stew.",
        "15 min",
        10000,
        ''),
    FoodsModel(
        "Biryani Kuku",
        4.9,
        "./assets/biryanikuku.png",
        "A flavorful Tanzanian rice dish cooked with chicken, spices, and vegetables.",
        "15 min",
        15000,
        ''),
    FoodsModel(
        "Chips Kavu",
        4.9,
        "./assets/chipskavu.png",
        "Crispy French fries (chips), a popular Tanzanian street food.",
        "15 min",
        7500,
        ''),
    FoodsModel(
        "Wali Kuku",
        4.9,
        "./assets/walikuku.png",
        "Traditional Tanzanian rice dish cooked with tender chicken and aromatic spices.",
        "15 min",
        12000,
        ''),
    FoodsModel(
        "Wali Nyama",
        4.9,
        "./assets/walinyama.png",
        "Hearty Tanzanian rice dish served with delicious beef stew.",
        "15 min",
        10000,
        ''),
    FoodsModel(
        "Biryani Kuku",
        4.9,
        "./assets/biryanikuku.png",
        "A flavorful Tanzanian rice dish cooked with chicken, spices, and vegetables.",
        "15 min",
        15000,
        ''),
    FoodsModel(
        "Chips Kavu",
        4.9,
        "./assets/chipskavu.png",
        "Crispy French fries (chips), a popular Tanzanian street food.",
        "15 min",
        7500,
        ''),
    FoodsModel(
        "Wali Kuku",
        4.9,
        "./assets/walikuku.png",
        "Traditional Tanzanian rice dish cooked with tender chicken and aromatic spices.",
        "15 min",
        12000,
        ''),
    FoodsModel(
        "Wali Nyama",
        4.9,
        "./assets/walinyama.png",
        "Hearty Tanzanian rice dish served with delicious beef stew.",
        "15 min",
        10000,
        ''),
    FoodsModel(
        "Biryani Kuku",
        4.9,
        "./assets/biryanikuku.png",
        "A flavorful Tanzanian rice dish cooked with chicken, spices, and vegetables.",
        "15 min",
        15000,
        ''),
    FoodsModel(
        "Chips Kavu",
        4.9,
        "./assets/chipskavu.png",
        "Crispy French fries (chips), a popular Tanzanian street food.",
        "15 min",
        7500,
        ''),
    FoodsModel(
        "Wali Kuku",
        4.9,
        "./assets/walikuku.png",
        "Traditional Tanzanian rice dish cooked with tender chicken and aromatic spices.",
        "15 min",
        12000,
        ''),
    FoodsModel(
        "Wali Nyama",
        4.9,
        "./assets/walinyama.png",
        "Hearty Tanzanian rice dish served with delicious beef stew.",
        "15 min",
        10000,
        ''),
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
  String? description;

  CoffeeModel(this.coffeeName, this.coffeeRating, this.coffeeImage,
      this.preparationTime, this.price, this.category, this.description);
}

class CoffeeModelData {
  static List<CoffeeModel> getCoffee = [
    CoffeeModel("Arabica Coffee", 4.9, "./assets/arabica.jpeg", "5 min", 5000,
        '', "A smooth and aromatic coffee with notes of fruit and sweetness."),
    CoffeeModel("Liberica Coffee", 4.9, "./assets/liberica.jpeg", "5 min", 7500,
        '', "A bold and fruity coffee with a unique smoky or woody flavor."),
    CoffeeModel("Milky Coffee", 4.9, "./assets/milky.jpeg", "5 min", 12000, '',
        "A creamy coffee with a perfect balance of coffee and milk."),
    CoffeeModel("Robusta Coffee", 4.9, "./assets/robusta.jpeg", "5 min", 10000,
        '', "A strong and bitter coffee with high caffeine content."),
    CoffeeModel("Arabica Coffee", 4.9, "./assets/arabica.jpeg", "5 min", 5000,
        '', "A smooth and aromatic coffee with notes of fruit and sweetness."),
    CoffeeModel("Liberica Coffee", 4.9, "./assets/liberica.jpeg", "5 min", 7500,
        '', "A bold and fruity coffee with a unique smoky or woody flavor."),
    CoffeeModel("Milky Coffee", 4.9, "./assets/milky.jpeg", "5 min", 12000, '',
        "A creamy coffee with a perfect balance of coffee and milk."),
    CoffeeModel("Nguu Coffee", 4.9, "./assets/nguu.jpeg", "5 min", 10000, '',
        "Traditional Tanzanian coffee with a rich, bold flavor."), // Replace with actual description
    CoffeeModel("Arabica Coffee", 4.9, "./assets/arabica.jpeg", "5 min", 5000,
        '', "A smooth and aromatic coffee with notes of fruit and sweetness."),
    CoffeeModel("Liberica Coffee", 4.9, "./assets/liberica.jpeg", "5 min", 7500,
        '', "A bold and fruity coffee with a unique smoky or woody flavor."),
    CoffeeModel("Milky Coffee", 4.9, "./assets/milky.jpeg", "5 min", 12000, '',
        "A creamy coffee with a perfect balance of coffee and milk."),
    CoffeeModel("Nguu Coffee", 4.9, "./assets/nguu.jpeg", "5 min", 10000, '',
        "Traditional Tanzanian coffee with a rich, bold flavor."), // Replace with actual description
    CoffeeModel("Arabica Coffee", 4.9, "./assets/arabica.jpeg", "5 min", 5000,
        '', "A smooth and aromatic coffee with notes of fruit and sweetness."),
    CoffeeModel("Liberica Coffee", 4.9, "./assets/liberica.jpeg", "5 min", 7500,
        '', "A bold and fruity coffee with a unique smoky or woody flavor."),
    CoffeeModel("Tanga Coffee", 4.9, "./assets/tanga.jpeg", "5 min", 12000, '',
        "A Tanzanian coffee with a vibrant acidity and fruity aroma."), // Replace with actual description
    CoffeeModel("Nguu Coffee", 4.9, "./assets/nguu.jpeg", "5 min", 10000, '',
        "Traditional Tanzanian coffee with a rich, bold flavor."),
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
  String? description;

  SoftDrinksModel(this.softDrinkName, this.softDrinkRating, this.softDrinkImage,
      this.preparationTime, this.price, this.category, this.description);
}

class SoftDrinksModelData {
  static List<SoftDrinksModel> getSoftDrinks = [
    SoftDrinksModel(
        "Cocktail",
        4.9,
        "./assets/cocktail.jpeg",
        "5 min",
        5000,
        '',
        "A refreshing mix of fruit juices, often with soda or other carbonated beverages."),
    SoftDrinksModel("Sprite", 4.9, "./assets/sprite.jpeg", "5 min", 7500, '',
        "A clear, lemon-lime flavored soda with a crisp, refreshing taste."),
    SoftDrinksModel("Pepsi", 4.9, "./assets/pepsi.jpeg", "5 min", 12000, '',
        "A popular cola with a sweet and slightly citrusy flavor."),
    SoftDrinksModel(
        "Cocktail",
        4.9,
        "./assets/cocktail.jpeg",
        "5 min",
        10000,
        '',
        "A refreshing mix of fruit juices, often with soda or other carbonated beverages."),
    SoftDrinksModel("Mountain Dew", 4.9, "./assets/dew.jpeg", "5 min", 5000, '',
        "A citrus-flavored soda with a high caffeine content."),
    SoftDrinksModel("Sprite", 4.9, "./assets/sprite.jpeg", "5 min", 7500, '',
        "A clear, lemon-lime flavored soda with a crisp, refreshing taste."),
    SoftDrinksModel("Pepsi", 4.9, "./assets/pepsi.jpeg", "5 min", 12000, '',
        "A popular cola with a sweet and slightly citrusy flavor."),
    SoftDrinksModel("Coca-Cola", 4.9, "./assets/coke.jpeg", "5 min", 10000, '',
        "The world's most popular cola, known for its caramel flavor."),
    SoftDrinksModel("Mountain Dew", 4.9, "./assets/dew.jpeg", "5 min", 5000, '',
        "A citrus-flavored soda with a high caffeine content."),
    SoftDrinksModel("Sprite", 4.9, "./assets/sprite.jpeg", "5 min", 7500, '',
        "A clear, lemon-lime flavored soda with a crisp, refreshing taste."),
    SoftDrinksModel("Pepsi", 4.9, "./assets/pepsi.jpeg", "5 min", 12000, '',
        "A popular cola with a sweet and slightly citrusy flavor."),
    SoftDrinksModel("Coca-Cola", 4.9, "./assets/coke.jpeg", "5 min", 10000, '',
        "The world's most popular cola, known for its caramel flavor."),
    SoftDrinksModel("Mountain Dew", 4.9, "./assets/dew.jpeg", "5 min", 5000, '',
        "A citrus-flavored soda with a high caffeine content."),
    SoftDrinksModel("Sprite", 4.9, "./assets/sprite.jpeg", "5 min", 7500, '',
        "A clear, lemon-lime flavored soda with a crisp, refreshing taste."),
    SoftDrinksModel("Coca-Cola", 4.9, "./assets/coke.jpeg", "5 min", 12000, '',
        "The world's most popular cola, known for its caramel flavor."),
    SoftDrinksModel(
        "Orange Juice",
        4.9,
        "./assets/orangejuice.jpeg",
        "5 min",
        10000,
        '',
        "A refreshing and nutritious beverage made from fresh oranges."),
  ];

  static List<SoftDrinksModel> displaySoftDrinks =
      List.from(SoftDrinksModelData.getSoftDrinks);
}

class FruitsModel {
  String? fruitName;
  double? fruitRating;
  String? fruitImage;
  String? preparationTime;
  int? price;
  String? category;
  String? description;

  FruitsModel(this.fruitName, this.fruitRating, this.fruitImage,
      this.preparationTime, this.price, this.category, this.description);
}

class FruitsModelData {
  static List<FruitsModel> getFruits = [
    FruitsModel("Banana", 4.9, "./assets/banana.jpeg", "5 min", 5000, '',
        "A sweet, creamy fruit, often enjoyed as a snack or dessert."),
    FruitsModel("Mango", 4.9, "./assets/mango.jpeg", "5 min", 7500, '',
        "A juicy and flavorful tropical fruit with a sweet and tangy taste."),
    FruitsModel("Grapes", 4.9, "./assets/grapes.jpeg", "5 min", 12000, '',
        "Small, sweet berries that come in various colors, such as green, red, and purple."),
    FruitsModel("Orange", 4.9, "./assets/orange.jpeg", "5 min", 10000, '',
        "A citrus fruit with a vibrant, sweet, and tangy flavor."),
    FruitsModel(
        "Passion Fruit",
        4.9,
        "./assets/passion.jpeg",
        "5 min",
        5000,
        '',
        "A tropical fruit with a unique, tart, and sweet flavor, often used in juices and desserts."),
    FruitsModel("Pineapple", 4.9, "./assets/pineapple.jpeg", "5 min", 7500, '',
        "A large, spiky fruit with a sweet, tangy, and refreshing taste."),
    FruitsModel("Watermelon", 4.9, "./assets/watermelon.jpeg", "5 min", 12000,
        '', "A large, refreshing fruit with a juicy, sweet, and watery flesh."),
    FruitsModel("Orange", 4.9, "./assets/orange.jpeg", "5 min", 10000, '',
        "A citrus fruit with a vibrant, sweet, and tangy flavor."),
    FruitsModel("Grapes", 4.9, "./assets/grapes.jpeg", "5 min", 5000, '',
        "Small, sweet berries that come in various colors, such as green, red, and purple."),
    FruitsModel("Mango", 4.9, "./assets/mango.jpeg", "5 min", 7500, '',
        "A juicy and flavorful tropical fruit with a sweet and tangy taste."),
    FruitsModel("Banana", 4.9, "./assets/banana.jpeg", "5 min", 12000, '',
        "A sweet, creamy fruit, often enjoyed as a snack or dessert."),
    FruitsModel(
        "Passion Fruit",
        4.9,
        "./assets/passion.jpeg",
        "5 min",
        10000,
        '',
        "A tropical fruit with a unique, tart, and sweet flavor, often used in juices and desserts."),
    FruitsModel("Grapes", 4.9, "./assets/grapes.jpeg", "5 min", 5000, '',
        "Small, sweet berries that come in various colors, such as green, red, and purple."),
    FruitsModel("Pineapple", 4.9, "./assets/pineapple.jpeg", "5 min", 7500, '',
        "A large, spiky fruit with a sweet, tangy, and refreshing taste."),
    FruitsModel("Watermelon", 4.9, "./assets/watermelon.jpeg", "5 min", 12000,
        '', "A large, refreshing fruit with a juicy, sweet, and watery flesh."),
    FruitsModel("Orange", 4.9, "./assets/orange.jpeg", "5 min", 10000, '',
        "A citrus fruit with a vibrant, sweet, and tangy flavor."),
  ];

  static List<FruitsModel> displayFruits = List.from(FruitsModelData.getFruits);
}

class TeaModel {
  String? teaName;
  double? teaRating;
  String? teaImage;
  String? preparationTime;
  int? price;
  String? category;
  String? description;

  TeaModel(this.teaName, this.teaRating, this.teaImage, this.preparationTime,
      this.price, this.category, this.description);
}

class TeaModelData {
  static List<TeaModel> getTea = [
    TeaModel("Black Tea", 4.9, "./assets/blacktea.jpeg", "5 min", 5000, '',
        "A robust and flavorful tea with a slightly bitter taste, often enjoyed with milk or sugar."),
    TeaModel("Green Tea", 4.9, "./assets/greentea.jpeg", "5 min", 7500, '',
        "A delicate and earthy tea with a fresh, grassy flavor and numerous health benefits."),
    TeaModel("Matcha Tea", 4.9, "./assets/matcha.jpg", "5 min", 12000, '',
        "A finely ground green tea powder with a vibrant green color and a slightly sweet, vegetal taste."),
    TeaModel("Orange Tea", 4.9, "./assets/orangetea.jpeg", "5 min", 10000, '',
        "A blend of black tea with orange peel, offering a citrusy aroma and a refreshing taste."),
    TeaModel("Vanilla Tea", 4.9, "./assets/tea.jpeg", "5 min", 5000, '',
        "A fragrant tea infused with vanilla beans or flavoring, providing a sweet and comforting aroma."),
    TeaModel("Black Tea", 4.9, "./assets/blacktea.jpeg", "5 min", 7500, '',
        "A robust and flavorful tea with a slightly bitter taste, often enjoyed with milk or sugar."),
    TeaModel("Matcha Tea", 4.9, "./assets/matcha.jpg", "5 min", 12000, '',
        "A finely ground green tea powder with a vibrant green color and a slightly sweet, vegetal taste."),
    TeaModel("Orange Tea", 4.9, "./assets/orangetea.jpeg", "5 min", 10000, '',
        "A blend of black tea with orange peel, offering a citrusy aroma and a refreshing taste."),
    TeaModel("Yerba Mate Tea", 4.9, "./assets/Yerba.jpeg", "5 min", 5000, '',
        "A South American herbal tea known for its stimulating properties and earthy flavor."),
    TeaModel("Green Tea", 4.9, "./assets/greentea.jpeg", "5 min", 7500, '',
        "A delicate and earthy tea with a fresh, grassy flavor and numerous health benefits."),
    TeaModel("Black Tea", 4.9, "./assets/blacktea.jpeg", "5 min", 12000, '',
        "A robust and flavorful tea with a slightly bitter taste, often enjoyed with milk or sugar."),
    TeaModel("Vanilla Tea", 4.9, "./assets/tea.jpeg", "5 min", 10000, '',
        "A fragrant tea infused with vanilla beans or flavoring, providing a sweet and comforting aroma."),
    TeaModel("Matcha Tea", 4.9, "./assets/matcha.jpg", "5 min", 5000, '',
        "A finely ground green tea powder with a vibrant green color and a slightly sweet, vegetal taste."),
    TeaModel("Yerba Mate Tea", 4.9, "./assets/Yerba.jpeg", "5 min", 7500, '',
        "A South American herbal tea known for its stimulating properties and earthy flavor."),
    TeaModel("Green Tea", 4.9, "./assets/greentea.jpeg", "5 min", 12000, '',
        "A delicate and earthy tea with a fresh, grassy flavor and numerous health benefits."),
    TeaModel("Orange Tea", 4.9, "./assets/orangetea.jpeg", "5 min", 10000, '',
        "A blend of black tea with orange peel, offering a citrusy aroma and a refreshing taste."),
  ];

  static List<TeaModel> displayTea = List.from(TeaModelData.getTea);
}

class LocalFoodsModel {
  String? localFoodName;
  double? localFoodRating;
  String? localFoodImage;
  String? foodDescription; // Added this line for the description
  String? preparationTime;
  int? price;
  String? category;

  LocalFoodsModel(
      this.localFoodName,
      this.localFoodRating,
      this.localFoodImage,
      this.foodDescription,
      this.preparationTime,
      this.price,
      this.category); // Include the description parameter
}

class LocalFoodsList {
  static List<LocalFoodsModel> getLocalFoods = [
    LocalFoodsModel(
        "Biryani",
        4.9,
        "./assets/biryani.png",
        "A flavorful rice dish made with fragrant spices, vegetables, and meat (optional).",
        "15 min",
        5000,
        ''),
    LocalFoodsModel(
        "Pilau",
        4.9,
        "./assets/pilau.png",
        "A spiced rice dish cooked with meat, vegetables, and a blend of aromatic spices.",
        "15 min",
        7500,
        ''), // Fixed image path
    LocalFoodsModel(
        "Wali Nazi",
        4.9,
        "./assets/nazi.png",
        "A coconut-infused rice dish, often served with fish, chicken, or meat curry.",
        "15 min",
        12000,
        ''),
    LocalFoodsModel(
        "Ndizi Mzuzu",
        4.9,
        "./assets/mzuzu.png",
        "Roasted plantains, a popular side dish or snack in Tanzania.",
        "5 min",
        10000,
        ''),
    LocalFoodsModel(
        "Chips Mayai",
        4.9,
        "./assets/chips.png",
        "A hearty Tanzanian street food made with french fries cooked into an omelette.",
        "5 min",
        5000,
        ''),
    LocalFoodsModel(
        "Biryani",
        4.9,
        "./assets/biryani.png",
        "A flavorful rice dish made with fragrant spices, vegetables, and meat (optional).",
        "15 min",
        7500,
        ''),
    LocalFoodsModel(
        "Wali Nazi",
        4.9,
        "./assets/nazi.png",
        "A coconut-infused rice dish, often served with fish, chicken, or meat curry.",
        "15 min",
        12000,
        ''),
    LocalFoodsModel(
        "Ndizi Mzuzu",
        4.9,
        "./assets/mzuzu.png",
        "Roasted plantains, a popular side dish or snack in Tanzania.",
        "5 min",
        10000,
        ''),
    LocalFoodsModel(
        "Pilau Zenji",
        4.9,
        "./assets/pilauzanzibar.png",
        "A fragrant and flavorful pilau with Zanzibari spices, often cooked with seafood or meat.",
        "5 min",
        5000,
        ''),
    LocalFoodsModel(
        "Pilau",
        4.9,
        "./assets/pilau.png",
        "A spiced rice dish cooked with meat, vegetables, and a blend of aromatic spices.",
        "5 min",
        7500,
        ''), // Fixed image path
    LocalFoodsModel(
        "Biryani",
        4.9,
        "./assets/biryani.png",
        "A flavorful rice dish made with fragrant spices, vegetables, and meat (optional).",
        "15 min",
        12000,
        ''),
    LocalFoodsModel(
        "Chips Mayai",
        4.9,
        "./assets/chips.png",
        "A hearty Tanzanian street food made with french fries cooked into an omelette.",
        "5 min",
        10000,
        ''),
    LocalFoodsModel(
        "Wali Nazi",
        4.9,
        "./assets/nazi.png",
        "A coconut-infused rice dish, often served with fish, chicken, or meat curry.",
        "5 min",
        5000,
        ''),
    LocalFoodsModel(
        "Pilau Zenji",
        4.9,
        "./assets/pilauzanzibar.png",
        "A fragrant and flavorful pilau with Zanzibari spices, often cooked with seafood or meat.",
        "5 min",
        7500,
        ''),
    LocalFoodsModel(
        "Pilau",
        4.9,
        "./assets/pilau.png",
        "A spiced rice dish cooked with meat, vegetables, and a blend of aromatic spices.",
        "5 min",
        12000,
        ''), // Fixed image path
    LocalFoodsModel(
        "Ndizi Mzuzu",
        4.9,
        "./assets/mzuzu.png",
        "Roasted plantains, a popular side dish or snack in Tanzania.",
        "5 min",
        10000,
        ''),
  ];

  static List<LocalFoodsModel> displayLocalFoods =
      List.from(LocalFoodsList.getLocalFoods);
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
